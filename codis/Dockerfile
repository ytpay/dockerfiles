FROM golang:1.12.7-alpine3.10 AS builder

ENV VERSION 3.2.2
ENV GIT_URL https://github.com/CodisLabs/codis.git
ENV SOURCE_DIR ${GOPATH}/src/github.com/CodisLabs

RUN set -ex \
    && apk upgrade \
    && apk add bash git linux-headers build-base autoconf \
    && mkdir -p ${SOURCE_DIR} \
    && (cd ${SOURCE_DIR} \
    && git clone --branch ${VERSION} ${GIT_URL}) \
    && make -C ${SOURCE_DIR}/codis distclean \
    && make -C ${SOURCE_DIR}/codis build-all


FROM alpine:3.10 AS dist

LABEL maintainer="mritd <mritd@linux.com>"

ARG TZ="Asia/Shanghai"

ENV TZ ${TZ}
ENV PATH ${PATH}:/usr/local/codis/bin

RUN apk upgrade \
    && apk add bash tzdata \
    && ln -sf /usr/share/zoneinfo/${TZ} /etc/localtime \
    && echo ${TZ} > /etc/timezone \
    && rm -rf /var/cache/apk/*

COPY --from=builder /go/src/github.com/CodisLabs/codis/bin /usr/local/codis

WORKDIR /data

CMD ["/bin/bash"]
