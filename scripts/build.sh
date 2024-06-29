#!/usr/bin/env bash

cd $(dirname "${BASH_SOURCE[0]}")
set -euxo pipefail




if docker buildx ls | grep -q multi-arch; then
  echo "Builder exists"
else
  echo "Builder does not exist"
    docker buildx create --name multi-arch --use
fi
docker buildx build --platform=linux/amd64,linux/arm64 -t coder-logstream-kube:latest ../ -f Dockerfile
