# Dockerfiles

This repository contains **Dockerfiles** of various images based on [Alpine Linux][1] 3.3 and [CentOS][2] 6.x and published to the public [Docker Hub Registry][3].

## Prerequisites

1. Install [Docker][4]
2. Download an automated build from the public [Docker Hub Registry][3]: 

## Images 

| Pull                                  | Usage                                                                       | Description                        |
|---------------------------------------|-----------------------------------------------------------------------------|------------------------------------|
| `docker pull niden/base-alpine`       | `docker run --name="wolverine" -it niden/base-alpine /bin/bash`             | Compact Docker base image Alpine   |
| `docker pull niden/base-centos6`      | `docker run --name="gambit" -it niden/base-centos6 /bin/bash`               | Compact Docker base image CentOS 6 |
| `docker pull niden/memcached-alpine`  | `docker run -d -P --name="storm" -it niden/memcached-alpine`                | Memcached server on Alpine         |
| `docker pull niden/memcached-centos6` | `docker run -d -P --name="cyclops" -it niden/memcached-centos6`             | Memcached server on CentOS 6       |
| `docker pull niden/composer-alpine`   | `docker run -it --rm --name="banshee" -v $(pwd):/app niden/composer-alpine` | Composer on Alpine                 |


[1]: http://www.alpinelinux.org/
[2]: https://centos.org/
[3]: https://hub.docker.com/
[4]: https://www.docker.com/
[5]: https://hub.docker.com/_/alpine/
[6]: https://hub.docker.com/_/centos/
[7]: https://hub.docker.com/r/niden/base-alpine/
[8]: https://hub.docker.com/r/niden/base-centos6/
