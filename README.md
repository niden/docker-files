# Dockerfiles

This repository contains **Dockerfiles** of various images based on [Alpine Linux][1] latest published in [Docker Hub Registry][3].

## Prerequisites

1. Install [Docker][4]
2. Download an automated build from the public [Docker Hub Registry][3]: 

## Images 
### Utilities
#### ab
```
docker pull niden/ab
docker run --rm -it --net host --name ab niden/ab
```

#### htop
```
docker pull niden/htop
docker run --rm -it --pid host --net none --name htop niden/htop
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

#### nginx
```
docker pull niden/nginx
docker run -d \
       -v /home/niden/web/logs/:/data/logs \
       -v /home/niden/web/config/:/data/config \
       -v /home/niden/web/sites/:/data/sites \
       --name niden_nginx niden/nginx
```


[1]: http://www.alpinelinux.org/
[3]: https://hub.docker.com/
[4]: https://www.docker.com/
