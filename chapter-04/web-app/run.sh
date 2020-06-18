#!/bin/bash

SCRIPT=$(readlink -f $0)
BASE_DIR=`dirname ${SCRIPT}`

python3 -m http.server 8080 --directory $BASE_DIR
