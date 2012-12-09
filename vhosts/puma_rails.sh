read -r -d '' SERVER_CONF <<'EOF'
upstream app_server_${1} {
  server unix:${2}/tmp/sockets/puma.sock fail_timeout=0;
}

server {
  listen 80;
  client_max_body_size 4G;
  server_name *.webvite.dev wedvite.dev;
  keepalive_timeout 5;
  root ${2}/public;
  try_files $uri/index.html $uri.html $uri @app;

  location @app {
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header Host $http_host;
    proxy_redirect off;
    proxy_pass http://app_server_${1};
  }

  error_page 500 502 503 504 /500.html;
  location = /500.html {
    root ${2}/public;
  }
}
EOF

echo "$SERVER_CONF" > "/usr/local/etc/nginx/sites-available/${1}.conf"
ln -s "/usr/local/etc/nginx/sites-available/${1}.conf" "/usr/local/etc/nginx/sites-enabled/${1}.conf"

echo "in rails root run:"
echo "unicorn_rails -E development -l unix:/tmp/unicorn.sock"
