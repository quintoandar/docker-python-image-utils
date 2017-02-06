#!/bin/sh

if [ -z $@ ]; then
  if [ ! -z $WORKER ] && $WORKER = "true" ; then
    exec python ./mainp.py
  else
    exec uwsgi --ini deploy/server.ini
  fi
else
  exec "$@"
fi
