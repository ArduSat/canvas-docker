#!/bin/bash

set -e

./setenv.sh

exec /usr/bin/supervisord -c /etc/supervisor/supervisord.conf
