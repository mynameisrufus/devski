# Devski

Goal is to have something to that sets up `https://thing.whatever.dev`

__Current status: heavy development__

# Install

```shell
brew install nginx
```

iCheck out devski into ~/.devski

```shell
$ git clone git@github.com:mynameisrufus/devski.git ~/.devski
```

Add ~/.devski/bin to your $PATH for access to the devski command-line utility.

```shell
$ echo 'export PATH="$HOME/.devski/bin:$PATH"' >> ~/.bash_profile
```

Zsh note: Modify your `~/.zshenv` file instead of `~/.bash_profile`

## Debugging

nginx:
 
tail -f /tmp/nginx.error.log

## Credits

Thanks to `rbenv` for laying a good example of how to structure this and a bunch
of code.
