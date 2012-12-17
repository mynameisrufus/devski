# Devski

Goal is to have something to that sets up `whatever.dev` for you with https and
subdomains.

__Current status: heavy development__

# Install for comrade

iCheck out devski into ~/.devski

```shell
$ git clone git@github.com:mynameisrufus/devski.git ~/.devski
```

Add ~/.devski/bin to your $PATH for access to the devski command-line utility.

```shell
$ echo 'export PATH="$HOME/.devski/bin:$PATH"' >> ~/.bash_profile
```

Zsh note: Modify your `~/.zshenv` file instead of `~/.bash_profile`

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

```shell
launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.nginx.plist
sudo mv launchctl ~/Library/LaunchAgents/homebrew.mxcl.nginx.plist /Library/LaunchAgents/homebrew.mxcl.nginx.plist
sudo chown root:admin /Library/LaunchAgents/homebrew.mxcl.nginx.plist
sudo launchctl load -w /Library/LaunchAgents/homebrew.mxcl.nginx.plist
```

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

# HTML

is here `/usr/local/Cellar/nginx/1.2.5/html`
