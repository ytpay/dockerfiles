## openjdk11

本镜像为 openjdk11 基础镜像，镜像大部份属性与 [openjdk8](https://github.com/Gozap/dockerfile/tree/master/openjdk8) 相同，区别在于 openjdk11 已经对容器化
有一定支持，`-XX:+UseContainerSupport` 和 `-XX:+PreferContainerQuotaForCPUCount` 让本镜像对容器
内存、cpu limit 能够自动响应
