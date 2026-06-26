#!/bin/bash
set -eux

dnf update -y
dnf install -y docker git

systemctl enable --now docker
usermod -aG docker ec2-user

mkdir -p /usr/local/lib/docker/cli-plugins
mkdir -p /usr/libexec/docker/cli-plugins
mkdir -p /opt/simple-saas-ec2

# Docker Compose
curl -fSL \
  https://github.com/docker/compose/releases/download/v2.39.4/docker-compose-linux-x86_64 \
  -o /usr/local/lib/docker/cli-plugins/docker-compose

# Docker Buildx, required for: docker compose up --build
curl -fSL \
  https://github.com/docker/buildx/releases/download/v0.35.0/buildx-v0.35.0.linux-amd64 \
  -o /usr/local/lib/docker/cli-plugins/docker-buildx

chmod +x /usr/local/lib/docker/cli-plugins/docker-compose
chmod +x /usr/local/lib/docker/cli-plugins/docker-buildx

cp /usr/local/lib/docker/cli-plugins/docker-compose /usr/libexec/docker/cli-plugins/docker-compose
cp /usr/local/lib/docker/cli-plugins/docker-buildx /usr/libexec/docker/cli-plugins/docker-buildx

chown -R ec2-user:ec2-user /opt/simple-saas-ec2

docker --version
docker compose version
docker buildx version