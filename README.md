[![auto-update](https://github.com/digrouz/docker-lidarr/actions/workflows/auto-update.yml/badge.svg)](https://github.com/digrouz/docker-lidarr/actions/workflows/auto-update.yml)
[![update-alpine](https://github.com/digrouz/docker-lidarr/actions/workflows/update-alpine.yml/badge.svg)](https://github.com/digrouz/docker-lidarr/actions/workflows/update-alpine.yml)
[![dockerhub](https://github.com/digrouz/docker-lidarr/actions/workflows/dockerhub.yml/badge.svg)](https://github.com/digrouz/docker-lidarr/actions/workflows/dockerhub.yml)
![Docker Pulls](https://img.shields.io/docker/pulls/digrouz/lidarr)

# docker-lidarr
Installs Lidarr into a Linux Container

![Lidarr](https://github.com/lidarr/Lidarr/raw/develop/Logo/128.png)

## Tag
Several tag are available:
* latest: see alpine-core
* alpine: see alpine-core
* alpine-core: [Dockerfile_alpine-core](https://github.com/digrouz/docker-lidarr/blob/master/Dockerfile_alpine-core)

## Description

Lidarr is a music collection manager for Usenet and BitTorrent users. It can monitor multiple RSS feeds for new tracks from your favorite artists and will grab, sort and rename them. It can also be configured to automatically upgrade the quality of files already downloaded when a better quality format becomes available.

https://lidarr.audio/

## Usage
    docker create --name=lidarr \
      -v /etc/localtime:/etc/localtime:ro \
      -v <path to config>:/config \
      -v <path to downloads>:/downloads \
      -v <path to music>:/music \
      -e UID=<UID default:12345> \
      -e GID=<GID default:12345> \
      -e AUTOUPGRADE=<0|1 default:0> \
      -e TZ=<timezone default:Europe/Brussels> \
      -p 8686:8686 \
      digrouz/lidarr

## Environment Variables

When you start the `lidarr` image, you can adjust the configuration of the `lidarr` instance by passing one or more environment variables on the `docker run` command line.

### `UID`

This variable is not mandatory and specifies the user id that will be set to run the application. It has default value `12345`.

### `GID`

This variable is not mandatory and specifies the group id that will be set to run the application. It has default value `12345`.

### `AUTOUPGRADE`

This variable is not mandatory and specifies if the container has to launch software update at startup or not. Valid values are `0` and `1`. It has default value `0`.

### `TZ`

This variable is not mandatory and specifies the timezone to be configured within the container. It has default value `Europe/Brussels`.

## Notes
* This container is built using [s6-overlay](https://github.com/just-containers/s6-overlay)
* The docker entrypoint can upgrade operating system at each startup. To enable this feature, just add `-e AUTOUPGRADE=1` at container creation.

## Issues

If you encounter an issue please open a ticket at [github](https://github.com/digrouz/docker-lidarr/issues)
