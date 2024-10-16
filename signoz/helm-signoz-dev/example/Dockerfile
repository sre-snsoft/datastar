# 使用官方 Python 3.9 基础镜像
FROM python:3.9-slim

# 将当前目录中的文件复制到容器的 /app 目录
WORKDIR /app
COPY . /app

# 设置运行命令，启动 Python 脚本
CMD ["python", "logger.py"]

