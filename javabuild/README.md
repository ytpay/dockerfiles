## java build

本仓库用于生成 java build 镜像，主要用于 CI Build，镜像内即成了 `maven`、`gradle`；
`cmvn`、`cgradle` 命令会将构建过程中下载的依赖统一 cache 到指定目录，具体 cache 目录请参阅 Dockerfile 文件；
本镜像 java 基础镜像来源于 `gozap/openjdk8`、`gozap/oraclejdk8`、`gozap/openjdk11`；
本镜像通过 `release.sh` 脚本发布到 DockerHub gozap 用户下，具体版本 tag 请自行查看
