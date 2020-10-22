#!/usr/bin/env bash

set -e

for image_tag in 8-jdk-hotspot 8-jdk-openj9 11-jdk-hotspot 11-jdk-openj9; do
    sed "s@{{BASE_IMAGE}}@ytpay/adoptopenjdk:${image_tag}@g" Dockerfile | docker build -t ytpay/javabuild:${image_tag} -f - .
    docker push ytpay/javabuild:${image_tag}
done
