#!/bin/bash

set -e

/opt/canvas/start.sh

exec /usr/bin/supervisord -c /etc/supervisor/supervisord.conf
