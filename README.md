# Devski

Goal is to have something to that sets up `whatever.dev` for you.

__Current status: heavy development__

# Install for comrade

```shell
brew install nginx
```

```shell
gem install unicorn
```

```shell
curl https://raw.github.com/mynameisrufus/devski/master/setup.sh | sh
```

```shell
cd ~/.devski
ln -s /path/to/myapp
```

launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.nginx.plist
sudo mv launchctl ~/Library/LaunchAgents/homebrew.mxcl.nginx.plist /Library/LaunchAgents/homebrew.mxcl.nginx.plist
sudo chown root:admin /Library/LaunchAgents/homebrew.mxcl.nginx.plist
sudo launchctl load -w /Library/LaunchAgents/homebrew.mxcl.nginx.plist

## Reload

sudo launchctl unload -w /Library/LaunchAgents/homebrew.mxcl.nginx.plist
sudo launchctl load -w /Library/LaunchAgents/homebrew.mxcl.nginx.plist

    unicorn_rails -E development -l unix:tmp/sockets/unicorn.sock

## Adding vhost

    sh vhosts/unicorn_rails.sh server_name /path_to_rails_root

## Debugging

nginx:
 
tail -f /tmp/nginx.error.log

## https

http://wiki.nginx.org/HttpSslModule

## Suggested API

devski add should restart nginx
```shell


$ devski install

$ devski add example -p /dir/my_app_dir -t rails -s unicorn
$ devski enable example
$ devski disable example
$ devski remove example

```

start app and tail log ctr+c to stop:
```shell

$ devski

```
