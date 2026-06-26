#!/bin/bash
set -eux

dnf update -y
dnf install -y docker git

systemctl enable docker
systemctl start docker

usermod -aG docker ec2-user

mkdir -p /opt/simple-saas-ec2
chown -R ec2-user:ec2-user /opt/simple-saas-ec2