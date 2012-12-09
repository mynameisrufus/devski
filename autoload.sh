#!/bin/sh

DIRS=`find ~/.devski/* -type l`

for d in $DIRS
do
  cd $d
  bundle exec unicorn_rails -E development -l unix:tmp/sockets/unicorn.sock -D
done
