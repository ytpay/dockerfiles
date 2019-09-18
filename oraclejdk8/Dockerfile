FROM debian:9-slim

LABEL maintainer="mritd <mritd@linux.com>"

ARG TZ="Asia/Shanghai"
ARG JAVA_GC_LOG="/var/log/jvmgc.log" 

ENV TZ ${TZ}
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV LANGUAGE en_US:en
ENV JAVA_VERSION 8u221
ENV JCE_POLICY_VERSION 8
ENV JAVA_HOME /usr/lib/jvm/default-jvm
ENV JAVA_GC_LOG ${JAVA_GC_LOG}

ENV TINI_VERSION v0.18.0
ENV TINI_DOWNLOAD_URL https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini-amd64

# refs => http://calvin1978.blogcn.com/articles/jvmoption-7.html
ENV JAVA_OPTS   -Djava.security.egd=file:/dev/./urandom \
                -XX:AutoBoxCacheMax=20000 \
                -XX:+UnlockExperimentalVMOptions \
                -XX:+UseCGroupMemoryLimitForHeap \
                -XX:+AlwaysPreTouch \
                -XX:+PrintCommandLineFlags \
                -XX:+PrintGCDateStamps \
                -XX:+PrintGCDetails \
                -XX:+PrintGCApplicationStoppedTime \
                -Xloggc:${JAVA_GC_LOG} \
                ${JAVA_OPTS}

RUN set -ex \
    && apt update -y \
    && apt upgrade -y \
    && apt install tzdata locales curl wget unzip \
        procps dnsutils iputils-ping vim less -y \
    && curl -sSL ${TINI_DOWNLOAD_URL} > /usr/bin/tini \
    && chmod +x /usr/bin/tini \
    && locale-gen --purge en_US.UTF-8 zh_CN.UTF-8 \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8 \
    && echo 'LANG="en_US.UTF-8"' > /etc/default/locale \
    && echo 'LANGUAGE="en_US:en"' >> /etc/default/locale \
    && ln -sf /usr/share/zoneinfo/${TZ} /etc/localtime \
    && echo "${TZ}" > /etc/timezone \
    && rm -rf /var/lib/apt/lists/* /tmp/*

COPY docker-java-home /usr/bin/docker-java-home
COPY jdk-${JAVA_VERSION}-linux-x64.tar.gz /
COPY jce_policy-${JCE_POLICY_VERSION}.zip /

RUN set -ex \
    && mkdir -p /usr/lib/jvm /usr/lib/jvm/java-${JAVA_VERSION}-oracle \
    && tar -xzf jdk-${JAVA_VERSION}-linux-x64.tar.gz \
        --strip-components=1 -C /usr/lib/jvm/java-${JAVA_VERSION}-oracle \
    && ln -s /usr/lib/jvm/java-${JAVA_VERSION}-oracle ${JAVA_HOME} \
    && ln -s ${JAVA_HOME}/bin/* /usr/bin/ \
    && unzip -jo -d ${JAVA_HOME}/jre/lib/security jce_policy-${JCE_POLICY_VERSION}.zip \ 
    && rm -rf   jdk-${JAVA_VERSION}u${JAVA_UPDATE}-linux-x64.tar.gz \
                ${JAVA_HOME}/*src.zip \
                jce_policy-${JCE_POLICY_VERSION}.zip \
                /tmp/*

ENTRYPOINT ["tini","--"]

CMD ["bash"]
