## gozap/build

这是一个 `All in one` 的 build 镜像，主要包含: oraclejdk8、openjdk8、jdk11、nodejs10、maven、gradle、yarn

### Cache

默认镜像内包含三个带有 cache 设置的命令

- `cmvn`: 将 maven local repo 设置为 `MAVEN_CACHE_DIR` 目录(默认为 `/data/maven_cache`)，其他等同于 `maven` 命令
- `cnpm`: 将 npm registry 设置为 `NPM_REGISTRY`(默认为淘宝)，disturl 设置为 `NPM_DISTURL`(默认为淘宝)，cache 目录设置为 `NPM_CACHE_DIR`(默认为 `/data/npm_cache`)，其他等同于 `npm` 命令
- `cyarn`: 将 yarn registry 设置为 `YARN_REGISTRY`(默认为淘宝)，cache-folder 设置为 `YARN_CACHE_DIR`(默认为 `/data/yarn_cache`)，其他等同于 `yarn` 命令

gradle 受环境变量 `GRADLE_CACHE_DIR` 影响，默认将会使用 `/data/gradle_cache` 作为 cache 目录

**作为 CI Build 镜像使用时，最好持久化相关 cache 目录以增加编译速度**

### JDK 切换

多版本 JDK 由 SDKMAN 工具进行控制，在容器内可使用 `sdk` 命令切换想要使用的 JDK 版本

``` sh
source ~/.bashrc

# use jdk11
sdk use java 11.0.1-open
```

**具体的 JDK 等软件包版本可能随着本镜像不同版本略有变化，请关注 Dcokerfile 变量或在容器内使用 `sdk ls` 命令查看**
