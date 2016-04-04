# Dockerfiles

This repository contains **Dockerfiles** of various images based on [Alpine Linux][1] 3.3 and published to the public [Docker Hub Registry][4].

## Alpine Dockerfile

Compact Docker base image based on Alpine Linux

### Base Docker Image

[alpine:latest][5]

### Installation

1. Install [Docker][2]
2. Download an [automated build][3] from the public [Docker Hub Registry][4]: 

`docker pull niden/base-alpine`

### Usage

```sh
docker run --name="aliens" -it niden/base-alpine /bin/bash
```


## Zephir

Compact Docker image containing Zephir

### Base Docker Image

[niden:base-alpine][5]

### Installation

1. Install [Docker][2]
2. Download an [automated build][3] from the public [Docker Hub Registry][4]: 

`docker pull niden/zephir`

### Usage

```sh
docker run -it --rm niden/zephir
```

## Alias

Adding an alias for Zephir to your profile (`~/.bashrc`, `~/.bash_aliases`, `/etc/profile`):

```sh
alias zephir='docker run -it --rm --name=zephir -v $(pwd):/zephir niden/zephir'
```

[1]: http://www.alpinelinux.org/
[2]: https://www.docker.com/
[3]: https://hub.docker.com/r/niden/base-alpine/
[4]: https://registry.hub.docker.com/
[5]: https://hub.docker.com/_/alpine/
