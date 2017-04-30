# Rundeck Docker Image

This dockerfile describes a basic installation of rundeck with external database.

## Image details

 - Based on phusion/baseimage
 - Uses init process and startup scripts as defined in the baseimage
 - SSH is disabled by default

## Startup

	# start postgresql database to use
	docker run -d \
		-v /etc/localtime:/etc/localtime:ro \
		-v /etc/timezone:/etc/timezone:ro \
		-e POSTGRES_USER=rundeck \
		-e POSTGRES_PASSWORD=rundeck \
		--name rundeckdb -h rundeckdb \
		 postgres:9.4.5

	# start rundeck container and bind it to local ip - rely on default env variables
	docker run --rm -ti \
		-p 127.0.0.1:4440:4440 \
		--link rundeckdb:db \
		--name rundeck -h rundeck \
		 mbopm/rundeck

## WebUI Login credentials

**user**: `admin`

**password**: `admin`

## Environment variables

### SERVER_URL

URL where the application can be found. This url is used by the application to generate target URLs. Example http://my-rundeck.example.org or http://local:4440. You won't be able to use the application without an appropriate value.

### DATABASE_URL

Connection string for the database to use. Defaults to jdbc:postgresql://db/rundeck.

### DATABASE_USER

User to connect to the database. Defaults to rundeck.

### DATABASE_PASS

Password of the database user to use. Defaults to rundeck.

## Volumes

Descriptions of defined volumes in this image.

### /var/rundeck

Here are the project files if you create any projects within rundeck.

### /etc/rundeck

Configuration files.

### /var/lib/rundeck/.ssh

SSH-keys used in rundeck. If nothing provided a new one is generated during container startup.

### /var/log/rundeck

Logfiles of rundeck.

## License

By using this image you agree to the oracle java license that would be displayed during installation.

