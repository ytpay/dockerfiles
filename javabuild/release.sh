#!/bin/bash

set -ex

for base_image in openjdk8 oraclejdk8 openjdk11; do
    sed "s@{{BASE_IMAGE}}@gozap/${base_image}@g" Dockerfile | docker build -t gozap/javabuild:${base_image} -f - .
    docker push gozap/javabuild:${base_image}
done
