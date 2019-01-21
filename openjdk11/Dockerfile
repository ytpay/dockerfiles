FROM openjdk:11.0.1-jdk-slim-stretch 

LABEL maintainer="mritd <mritd1234@gmail.com>"

ARG TZ="Asia/Shanghai"
ARG JAVA_OPTS="-XX:+PrintFlagsFinal"
ARG JAVA_GC_LOG="/var/log/jvmgc.log"

ENV JAVA_GC_LOG ${JAVA_GC_LOG}

# refs => http://calvin1978.blogcn.com/articles/jvmoption-7.html
ENV JAVA_OPTS   -Djava.security.egd=file:/dev/./urandom \
                -XX:AutoBoxCacheMax=20000 \
                -XX:+UseContainerSupport \
                -XX:+PreferContainerQuotaForCPUCount \
                -XX:+AlwaysPreTouch \
                -XX:+PrintCommandLineFlags \
                -XX:+PrintGCDateStamps \
                -XX:+PrintGCDetails \
                -XX:+PrintGCApplicationStoppedTime \
                -Xloggc:${JAVA_GC_LOG} \
                ${JAVA_OPTS}

RUN apt update -y \
    && apt upgrade -y \
    && apt install tzdata -y \
    && ln -sf /usr/share/zoneinfo/${TZ} /etc/localtime \
    && echo ${TZ} > /etc/timezone \
    && apt autoremove -y \
    && apt autoclean -y \
    && rm -rf /var/lib/apt/lists/*

CMD ["bash"]
