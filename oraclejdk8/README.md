由于 oracle jdk License 问题，导致公开下载地址再一段时间后就会失效，
最终此 Dockerfile 将会出现无法重新 build；所以最终决定移除下载动作，
统一由用户自行下载 oracle jdk 压缩包以及 jce policy 授权文件。
