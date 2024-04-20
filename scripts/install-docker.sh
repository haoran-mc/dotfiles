#!/bin/bash

# https://docs.docker.com/engine/install/centos/


# 添加 docker 用户组
sudo groupadd docker

# 将当前登录用户加入到 docker 用户组
sudo usermod -aG docker $USER
sudo gpasswd -a $USER docker

# 更新用户组以使修改生效
newgrp docker

sudo systemctl daemon-reload
sudo systemctl restart docker


docker run hello-world
