## openjdk8

本镜像为 opnejkdk8 基础镜像，基础镜像来源于官方 openjdk8 镜像，本镜像内集成了 tini 工具以保证正确的信号处理；
tini 会作为 PID 1 进程启动，并转发外部信号到内部应用，在启动内部应用时请避免采用 shell 脚本启动，这会导致 tini
的信号传递无效；基于本镜像的 java 应用应当采用 `CMD ["bash","-c","java -jar *.jar"]` 方式启动以保证应用能
够优雅关闭；镜像内加入了一些通用的 `JAVA_OPTS`；自定义 `JAVA_OPTS` 可以通过 `--build-arg` 传入并覆盖；
**openjdk8 对容器化支持有限，本镜像对于外部内存 limit 已经可以自适应，但是对于外部 cpu limit 无法正确响应**
