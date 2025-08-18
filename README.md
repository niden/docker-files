# Dockerfiles

This repository contains **Dockerfiles** of various images based on [Alpine Linux][1] latest published in [Docker Hub Registry][3].

## Prerequisites

1. Install [Docker][4]
2. Download an automated build from the public [Docker Hub Registry][3]: 
3. If using containers that require display, you need `sudo xhost +local:docker`

## Images 
### Utilities
#### ab
```
docker pull niden/ab
docker run --rm -it --net host --name ab niden/ab
```

#### curl
```
docker pull niden/htop
docker run --rm -it --pid host --net none --name curl niden/curl
```

#### gimp
```
docker pull niden/gimp
docker run -d \
    -v /etc/localtime:/etc/localtime:ro \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    --net host \
    -e "DISPLAY=unix${DISPLAY}" \
    -v "${HOME}:/root" \
    -e GDK_SCALE \
    -e GDK_DPI_SCALE \
    --name niden \
    niden/gimp
```

#### htop
```
docker pull niden/htop
docker run --rm -it --pid host --net none --name htop niden/htop
```

#### jq
```
docker pull niden/jq
docker run --rm -it --pid host --net none --name jq niden/jq
```

#### libreoffice
```
docker pull niden/libreoffice
docker run -d \
    -v /etc/localtime:/etc/localtime:ro \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    --net host \
    -e "DISPLAY=unix${DISPLAY}" \
    -v "${HOME}:/root" \
    -e GDK_SCALE \
    -e GDK_DPI_SCALE \
    --name niden_libreoffice \
    niden/libreoffice
```

#### nmap
```
docker pull niden/nmap
docker run --rm -it --net host --name nmap niden/nmap
```

#### tcptraceroute
```
docker pull niden/tcptraceroute
docker run --rm -it --net host --name tcptraceroute niden/tcptraceroute
```

### Services
#### Memcached
```
docker pull niden/memcached`
docker run -d --net host --name memcached niden/memcached
```

#### Memcached
```
docker pull niden/mariadb`
docker run -d --net host --name mariadb niden/mariadb
```

#### PHP (cli)
```
docker pull niden/niden-php
docker run -it --rm $(pwd):/app niden-php:8.4 /bin/bash
```


[1]: http://www.alpinelinux.org/
[3]: https://hub.docker.com/
[4]: https://www.docker.com/
