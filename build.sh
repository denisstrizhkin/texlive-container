#!/usr/bin/env sh

set -xe

IMAGE_NAME="texlive"
TAG="latest"

podman build \
    -t "${IMAGE_NAME}:${TAG}" \
    -f Containerfile .
