#!/bin/bash
set -eu

apt-get update
DEBIAN_FRONTEND=noninteractive apt-get -y --no-install-recommends install \
    bats \
    build-essential
