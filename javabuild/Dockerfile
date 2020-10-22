FROM {{BASE_IMAGE}}

LABEL maintainer="mritd <mritd@linux.com>"

ENV MAVEN_VERSION 3.6.3
ENV MAVEN_CACHE_DIR /data/maven_cache
ENV MAVEN_INSTALL_DIR /usr/local/maven
ENV MAVEN_DOWNLOAD_URL http://mirrors.sonic.net/apache/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz

ENV GRADLE_VERSION 6.7
ENV GRADLE_CACHE_DIR /data/gradle_cache
ENV GRADLE_INSTALL_DIR /usr/local/gradle
ENV GRADLE_DOWNLOAD_URL https://downloads.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip

ENV PATH ${PATH}:${MAVEN_INSTALL_DIR}/bin:${GRADLE_INSTALL_DIR}/bin

RUN set -ex \
    && apt update \
    && apt install unzip -y \ 
    && curl -sSL ${MAVEN_DOWNLOAD_URL} > apache-maven-${MAVEN_VERSION}-bin.tar.gz \
    && tar -zxf apache-maven-${MAVEN_VERSION}-bin.tar.gz \
    && mv apache-maven-${MAVEN_VERSION} ${MAVEN_INSTALL_DIR} \
    && curl -sSL ${GRADLE_DOWNLOAD_URL} > gradle-${GRADLE_VERSION}-bin.zip \
    && unzip -q gradle-${GRADLE_VERSION}-bin.zip \
    && mv gradle-${GRADLE_VERSION} ${GRADLE_INSTALL_DIR} \
    && apt purge -y unzip \
    && rm -rf /var/lib/apt/lists/* \
        apache-maven-${MAVEN_VERSION}-bin.tar.gz \
        gradle-${GRADLE_VERSION}-bin.zip

COPY cmvn /usr/local/bin/cmvn
COPY cgradle /usr/local/bin/cgradle

VOLUME ${MAVEN_CACHE_DIR}
VOLUME ${GRADLE_CACHE_DIR}

CMD ["bash"]
