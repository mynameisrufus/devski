rndc-confgen > /etc/rndc.conf
head -n5 /etc/rndc.conf |tail -n4 > /etc/rndc.key

read -r -d '' NAMED_CONF <<'EOF'

zone "dev" IN {
  type master;
  file "dev.zone";
  allow-update { none; };
};

EOF
if [ "`grep dev.zone /etc/named.conf`" == "" ]
then
echo "$NAMED_CONF" >> /etc/named.conf
fi

read -r -d '' ZONE_CONF <<'EOF'
$TTL  60
$ORIGIN dev.
@      1D IN SOA localhost. root.localhost. (
          42   ; serial (d. adams)
          3H   ; refresh
          15M    ; retry
          1W   ; expiry
          1D )   ; minimum

      1D IN NS localhost
      1D IN A    127.0.0.1
localhost.dev. 60 IN A 127.0.0.1
*.dev. 60 IN A 127.0.0.1
EOF

echo "$ZONE_CONF" > /var/named/dev.zone

echo "nameserver 127.0.0.1" > "/etc/resolver/dev"

mkdir /usr/local/etc/nginx/{sites-available,sites-enabled,certs}

# https 

cd /usr/local/etc/nginx/certs
openssl genrsa -des3 -out dev.key 1024
openssl req -new -key dev.key -out dev.csr
cp dev.key dev.key.org
openssl rsa -in dev.key.org -out dev.key
openssl x509 -req -days 365 -in dev.csr -signkey dev.key -out dev.crt

launchctl load -w /System/Library/LaunchDaemons/org.isc.named.plist
named
