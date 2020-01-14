## openjdk11

> 本镜像为 openjdk11 基础镜像，镜像大部份属性与 [openjdk8](https://github.com/Gozap/dockerfile/tree/master/openjdk8) 相同

openjdk11 已经对容器化有一定支持，`JAVA_OPTS` 中 `-XX:+UseContainerSupport` 和 `-XX:+PreferContainerQuotaForCPUCount` 参数让本镜像对容器内存、cpu limit 能够自动响应；以下为推荐的 `JAVA_OPTS`

```sh
ENV JAVA_OPTS   -Djava.security.egd=file:/dev/./urandom \
                -XX:AutoBoxCacheMax=20000 \
                -XX:+UseContainerSupport \
                -XX:+PreferContainerQuotaForCPUCount \
                -XX:+AlwaysPreTouch \
                -XX:+PrintFlagsFinal \
                -XX:+PrintCommandLineFlags \
                -XX:+PrintGCDateStamps \
                -XX:+PrintGCDetails \
                -XX:+PrintGCApplicationStoppedTime \
                -Xloggc:/var/log/jvmgc.log
```
