#!/usr/bin/env bash

NOCACHE="$1"
CACHE_CMD=""

if [ "${NOCACHE}" == "nocache" ]; then
    CACHE_CMD="--no-cache"
fi

function build(){
    info "building adoptopenjdk openjdk8-hotspot..."
    sed "s@{{BASE_IMAGE}}@adoptopenjdk:8-jdk-hotspot@g" Dockerfile | docker build -t ytpay/adoptopenjdk:8-jdk-hotspot -f - . ${CACHE_CMD}

    info "building adoptopenjdk openjdk8-openj9..."
    sed "s@{{BASE_IMAGE}}@adoptopenjdk:8-jdk-openj9@g" Dockerfile | docker build -t ytpay/adoptopenjdk:8-jdk-openj9 -f - . ${CACHE_CMD}
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
