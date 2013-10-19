# Devski

Goal is to have something to that sets up `https://thing.whatever.dev`

__Current status: heavy development__

# Why not Pow?

"Pow is a zero-config Rack server for Mac OS X.", so it's limited. That's fine,
but how about development on a virtual machine? With Devski you would just proxy
`thing.dev` to whatever your virtual machines webserver port is on, Pow can't do
that.

Jetty, PHP, whatever.

SSL? done.

Have you ever tried to kill POW after it randomly died? Good times.

Pow is written in node.js, just saying.

Devski uses Nginx and you probably want to use it in production, therefore it
makes sense to dev on an environment as close as possible to your prod
environment.

What about debugging threaded code? With Devski you can run this and debug on
your local!

```shell
puma -b unix://tmp/sockets/puma.sock -e production
```

What about foreman? Devski works great with foreman because Nginx just proxies
to your server of choice.

# Install

Using boxen make sure you have dnsmasq and nginx running.

Check out devski into ~/.devski

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

## Credits

Thanks to `rbenv` for laying a good example of how to structure this and a bunch
of code.
