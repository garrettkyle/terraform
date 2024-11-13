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
DOCKER_COMPOSE_VERSION=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | jq -r .tag_name)
curl -SL "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-linux-x86_64" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Login to ECR
aws ecr get-login-password --region ca-central-1 | docker login --username AWS --password-stdin 715788907281.dkr.ecr.ca-central-1.amazonaws.com

# Download prometheus+alertmanager docker compose file from S3
aws s3 cp s3://terraform-sandbox-testing/compose.yaml /home/ec2-user/compose.yaml

# Bring the compose file up
docker-compose -f /home/ec2-user/compose.yaml up -d