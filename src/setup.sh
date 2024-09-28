#!/bin/bash
set -eu

# Add opensuse package sources
echo 'deb http://download.opensuse.org/repositories/openSUSE:/Tools/xUbuntu_24.04/ /' | tee /etc/apt/sources.list.d/openSUSE:Tools.list
curl -fsSL https://download.opensuse.org/repositories/openSUSE:Tools/xUbuntu_24.04/Release.key | gpg --dearmor | tee /etc/apt/trusted.gpg.d/openSUSE_Tools.gpg >/dev/null

# install obs-build
apt-get update
DEBIAN_FRONTEND=noninteractive apt-get -y --no-install-recommends install \
    obs-build=20240913-1 \
    libxml-parser-perl \
    python3 \
    zstd \
    qemu-kvm
