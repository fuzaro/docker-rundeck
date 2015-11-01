#!/bin/bash
if [ ! -f /var/lib/rundeck/.ssh/id_rsa ]; then
	sudo -u rundeck ssh-keygen -t rsa -f /var/lib/rundeck/.ssh/id_rsa -N ''
fi
