#!/bin/bash

docker run --rm -ti \
	-p 127.0.0.1:4440:4440 \
	-v /etc/localtime:/etc/localtime:ro \
	-v /etc/timezone:/etc/timezone:ro \
	--link rundeck_db:db \
	--name rundeck -h rundeck \
	 mbopm/rundeck $@
