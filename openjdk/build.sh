#!/usr/bin/env bash

NOCACHE="$1"
CACHE_CMD=""

if [ "${NOCACHE}" == "nocache" ]; then
    CACHE_CMD="--no-cache"
fi

function build(){
    for base_image in 8-jdk-hotspot 8-jdk-openj9 11-jdk-hotspot 11-jdk-openj9; do
        info "building adoptopenjdk ${base_image}..."
        sed "s@{{BASE_IMAGE}}@adoptopenjdk:${base_image}@g" Dockerfile | docker build -t ytpay/adoptopenjdk:${base_image} -f - . ${CACHE_CMD}
        docker push ytpay/adoptopenjdk:${base_image}
    done
}

function info(){
    echo -e "\033[32mINFO: $@\033[0m"
}

function warn(){
    echo -e "\033[33mWARN: $@\033[0m"
}

function err(){
    echo -e "\033[31mERROR: $@\033[0m"
}

build
