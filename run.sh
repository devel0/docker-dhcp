#!/bin/bash

#set -x

source /scripts/constants
source /scripts/utils.sh
exdir=`executing_dir`

container=dhcp
container_image=searchathing/dhcp
net=host
#ip="$ip_dhcp_srv"
cpus="2"
memory="256m"

dk-rm-if-exists $container $1

echo -n '---> starting...'

#privileged=
privileged="--privileged"

docker -D run \
        -d \
        -ti \
	-e TZ=`cat /etc/timezone` \
	$privileged \
	--name "$container" \
        --network="$net" \
        --restart="unless-stopped" \
        --cpus="$cpus" \
        --memory="$memory" \
	--volume="$exdir/imgdata/dhcpd.conf:/etc/dhcp/dhcpd.conf" \
        "$container_image"
