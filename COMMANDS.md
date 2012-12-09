# unload command:

sudo launchctl unload -w /Library/LaunchAgents/homebrew.mxcl.nginx.plist

# load command:

sudo launchctl load -w /Library/LaunchAgents/homebrew.mxcl.nginx.plist

# restart:

unload + load

# sym link:

ln -s /usr/local/etc/nginx/sites-available/nextbestbit.conf
/usr/local/etc/nginx/sites-enabled/.
