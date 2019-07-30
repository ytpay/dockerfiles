FROM nginx:1.17.2-alpine

LABEL maintainer="mritd <mritd@linux.com>"

ARG TZ='Asia/Shanghai'

ENV TZ ${TZ}

RUN apk upgrade --update \
    && apk add bash \
    && ln -sf /usr/share/zoneinfo/${TZ} /etc/localtime \
    && echo ${TZ} > /etc/timezone \
    && rm -rf /usr/share/nginx/html /var/cache/apk/*

COPY nginx.vh.default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

STOPSIGNAL SIGTERM

CMD ["nginx", "-g", "daemon off;"]
