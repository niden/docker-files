#!/bin/sh
set -e

# set apache as owner/group
if [ "$FIX_OWNERSHIP" != "" ]; then
	chown -R www-data.www-data /data
fi

exec httpd -DFOREGROUND
