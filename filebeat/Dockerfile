FROM golang:1.14.6-alpine3.12 as builder

ENV FILEBEAT_VERSION 7.8.1
ENV FILEBEAT_SOURCE_PATH ${GOPATH}/src/github.com/elastic

ENV GOPROXY https://goproxy.io

COPY processors /tmp/processors

WORKDIR ${FILEBEAT_SOURCE_PATH}

RUN set -ex \
    && apk upgrade \
    && apk add bash git build-base \
    && git clone https://github.com/elastic/beats.git \
    && cd ${FILEBEAT_SOURCE_PATH}/beats/filebeat \
    && git checkout v${FILEBEAT_VERSION} -b v${FILEBEAT_VERSION} \
    && for p in $(cat /tmp/processors); do \
           echo "import _ \"$p\"" >> ../libbeat/cmd/instance/imports_common.go; \
       done \
    && make

FROM alpine:3.12 as dist

ARG TZ="Asia/Shanghai"

ENV TZ ${TZ}
ENV FILEBEAT_VERSION 7.8.1

RUN set -ex \
    && apk upgrade \
    && apk add bash tzdata ca-certificates \
    && ln -sf /usr/share/zoneinfo/${TZ} /etc/localtime \
    && echo ${TZ} > /etc/timezone \
    && rm -rf /var/cache/apk/*

COPY --from=builder /go/src/github.com/elastic/beats/filebeat/filebeat /usr/local/bin/filebeat

ENTRYPOINT ["filebeat"]

CMD ["-environment", "container","-e"]
