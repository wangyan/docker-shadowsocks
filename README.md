# 一、概述

`docker-shadowsocks` 是基于最新的Debian系统构建Docker镜像，支持通过配置文件或命令行的方式运行shadowsocks。

# 二、快速开始

方法一是通过命令行的方式，方法二：通过配置文件的方式。

## 方法一、通过命令行的方式

```
docker run -d -p [host_port]:[container_port] --name shadowsocks \
-d myidwy/docker-shadowsocks \
-p [server_port] -k [password] -m [aes-encrypt_method-cfb]
```

参数说明：

```
-p <host_port>:<container_port> 宿主机对外端口:容器内服务端口
-p <server_port> 容器内服务端口
-k <password> shadowsocks 密码
-m <encrypt_method> 加密方法
```

**实例：（指定端口8388，密码123456）**

```
docker run -d -p 8388:8388 --name shadowsocks \
-d myidwy/docker-shadowsocks \
-p 8388 -k 123456 -m aes-256-cfb
```

## 方法二：通过配置文件的方式

```
docker run -d -p [host_port]:[container_port] --name shadowsocks \
-e "SERVER_PORT=[server_port]" -e "PASSWORD=[password]" \
-d myidwy/docker-shadowsocks
```

参数说明：

```
<host_port>:<container_port> 宿主机对外端口:容器内服务端口
<server_port> shadowsocks服务端口（可选，默认8388）
<password> shadowsocks 密码，（可选，默认123456）
```

**实例1：（指定端口和密码）**

```
docker run -d -p 8388:8388 --name shadowsocks \
-e "PASSWORD=123456" -e  "SERVER_PORT=8388" \
-d myidwy/docker-shadowsocks
```

**实例2：（端口和密码都不指定，使用默认值）**

```
docker run -d -p 8388:8388 --name shadowsocks \
-d myidwy/docker-shadowsocks
```

**实例3：（指定密码、，其他默认值）**

```
docker run -d -p 8388:8388 --name shadowsocks \
-e "PASSWORD=123456" \
-d myidwy/docker-shadowsocks
```

## 三、调试

查看日志

```
docker logs shadowsocks
```

进入交互的shell终端

```
docker exec -it shadowsocks bash
```