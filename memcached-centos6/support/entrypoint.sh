#!/bin/bash

# Credits memcached team (https://github.com/docker-library/memcached)
set -e

# first check if we're passing flags, if so
# prepend with memcached
if [ "${1:0:1}" = '-' ]; then
	set -- memcached "$@"
fi

exec "$@"
