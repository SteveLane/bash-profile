#!/usr/bin/env bash
# Time-stamp: <2018-03-23 14:22:26 (slane)>
# Remove untagged images from docker
images=($(docker images --no-trunc | grep '<none>' | awk '{ print $3 }'))
for im in "${images[@]}"; do
    docker rmi --force "$im"
done
