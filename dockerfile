FROM node:18-bullseye

# 安装依赖
RUN apt-get update && \
    apt-get install -y python3 curl unzip imagemagick --fix-missing && \
    rm -rf /var/lib/apt/lists/*

# 设置工作目录
WORKDIR /app

# 复制 Quiver 文件
COPY . .

# 构建 Quiver
RUN make

# 暴露端口
EXPOSE 8000

# 启动 Quiver（运行阶段）
CMD ["make", "serve"]