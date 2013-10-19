# Devski

### В советской России мы используем Nginx в развитии

Devski manages nginx vhosts on your development machine so you can dev in the 
closest possible environment to production.

Devski enables you dev with the following on your development machine:

* .dev domain using boxen
* https
* create a vhost with a single command

Current commands:

```shell
❯ devski commands
--version
add
available
commands
disable
enable
enabled
help
install
link
open
reload
remove
templates
test
uninstall
❯
```

# Install

Using boxen make sure you have dnsmasq and nginx running.

```shell
git clone git@github.com:mynameisrufus/devski.git ~/.devski
```

Add ~/.devski/bin to your $PATH for access to the devski command-line utility.

```shell
echo 'export PATH="$HOME/.devski/bin:$PATH"' >> ~/.bash_profile
```

Zsh note: Modify your `~/.zshenv` file instead of `~/.bash_profile`

Symlink your sites dir to your devski enabled dir with `devski link` this is
equivalent to:

```shell
rm -rf /opt/boxen/config/nginx/sites
ln -s ~/.devski/nginx/sites-enabled /opt/boxen/config/nginx/sites
```

Each time you run boxen you symlink will go missing so you will have to do this
again.

## Debugging

nginx:

``` 
tail -f /opt/boxen/log/nginx/*.log
```
