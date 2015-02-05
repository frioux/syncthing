#!/bin/dash

export HOME=/home/user
export STNORESTART=1

exec 2>&1 sudo -u user /usr/bin/syncthing -logflags 0
