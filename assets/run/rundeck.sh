#!/bin/bash

. /lib/lsb/init-functions
. /etc/rundeck/profile

prog="rundeckd"
RETVAL=0
PIDFILE=/var/run/$prog.pid
DAEMON="${JAVA_HOME:-/usr}/bin/java"
DAEMON_ARGS="${RDECK_JVM} -cp ${BOOTSTRAP_CP} com.dtolabs.rundeck.RunServer /var/lib/rundeck ${RDECK_HTTP_PORT}"
rundeckd="$DAEMON $DAEMON_ARGS"

echo "Starting $prog"
cd /var/log/rundeck
exec /sbin/setuser rundeck $rundeckd >> /var/log/rundeck/rundeck_init.log 2>&1
