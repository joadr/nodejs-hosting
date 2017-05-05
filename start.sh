#!/bin/sh
set -e

echo "====> Starting server..."
nohup sh /home/deploy/script/run.sh > /dev/null 2>&1 &
