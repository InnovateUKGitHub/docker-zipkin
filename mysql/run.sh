#!/bin/sh

if ! whoami &> /dev/null; then
  if [ -w /etc/passwd ]; then
    sed -i "s/:x:mysql:/:x:$(id -u):/" /etc/passwd
  fi
fi

/usr/bin/mysqld_safe --user=mysql --basedir=/usr/ --datadir=/mysql/data --syslog
