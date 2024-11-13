#!/bin/bash

set -x

yum update -y
yum upgrade -y

# Install Docker
yum install docker -y

# Start Docker service and enable to run at startup
systemctl start docker
systemctl enable docker

# Install Docker Compose
DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
mkdir -p $DOCKER_CONFIG/cli-plugins
curl -SL https://github.com/docker/compose/releases/download/v2.30.3/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose
chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose

# Allow Docker to be run as non-root ec2-user
usermod -aG docker ec2-user