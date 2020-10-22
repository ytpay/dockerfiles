## openjdk

> 本镜像为 opnejkdk 基础镜像，基础镜像来源于 AdoptOpenJDK 镜像；容器化环境下推荐切换到 OpenJ9。

### Tini

镜像内集成了 tini 工具以保证正确的信号处理；tini 会作为 PID 1 进程启动，并转发外部信号到内部应用，在启动内部应用时请避免采用 shell 脚本启动，这会导致 tini的信号传递无效；基于本镜像的 java 应用应当采用 `CMD ["bash","-c","java -jar *.jar"]` 方式启动以保证应用能够优雅关闭。

### JAVA_OPTS

以下为一些常用的 `JAVA_OPTS`，推荐在业务镜像中加入；**其中 `-XX:+UseCGroupMemoryLimitForHeap` 参数保证在 jvm 在容器内的内存自适应，强烈推荐开启**

```sh
ENV JAVA_OPTS   -Djava.security.egd=file:/dev/./urandom \
                -XX:AutoBoxCacheMax=20000 \
                -XX:+UnlockExperimentalVMOptions \
                -XX:+UseCGroupMemoryLimitForHeap \
                -XX:+AlwaysPreTouch \
                -XX:+PrintFlagsFinal \
                -XX:+PrintCommandLineFlags \
                -XX:+PrintGCDateStamps \
                -XX:+PrintGCDetails \
                -XX:+PrintGCApplicationStoppedTime \
                -Xloggc:/var/log/jvmgc.log
```
