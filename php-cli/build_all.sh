#!/bin/bash

docker build -t niden/niden-php:8.1 --build-arg PHP_VERSION=8.1 .
docker build -t niden/niden-php:8.2 --build-arg PHP_VERSION=8.2 .
docker build -t niden/niden-php:8.3 --build-arg PHP_VERSION=8.3 .
docker build -t niden/niden-php:8.4 --build-arg PHP_VERSION=8.4 .

