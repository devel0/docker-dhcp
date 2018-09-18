#!/bin/bash

source /scripts/constants
source /scripts/utils.sh

exdir=`executing_dir`
container_image=searchathing/dhcp

#--[ get dns key ]
#docker cp dns:/etc/bind/rndc.key $exdir

args=""

if [ "$1" == "--no-cache" ]; then args="$1"; fi

#--[ build image ]
docker build $args --network=build $@ -t $container_image "$exdir"

#\rm -f $exdir/rndc.key
