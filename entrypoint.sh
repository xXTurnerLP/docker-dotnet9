#!/bin/bash

cd /home/container

shopt -s nullglob # allow pattern matching failure to omit result instead of returning the pattern used

exec /bin/bash -c "$STARTUP"