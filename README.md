# OBS build script action
[![Continuous Integration](https://github.com/package-building/obs-build-action/actions/workflows/ci.yml/badge.svg)](https://github.com/package-building/obs-build-action/actions/workflows/ci.yml)
[![Lint Codebase](https://github.com/package-building/obs-build-action/actions/workflows/linter.yml/badge.svg)](https://github.com/package-building/obs-build-action/actions/workflows/linter.yml)

This action builds packages by calling `pbuild` from the [OBS build script](https://github.com/openSUSE/obs-build).

## Runner dependencies
This action was tested on `ubuntu-24.04` runner, provided by GitHub.

At least those base packages are required:
* `ca-certificates`
* `curl`
* `gpg`
* `sudo`


## Usage

Here's an example of how to use this action in a workflow file.
See [obs-build-action-example](https://github.com/package-building/obs-build-action-example) for a full example.

```yaml
name: Example

on:
  pull_request:
    branches:
      - main
  push:
    branches:
      - main

jobs:
  build:
    name: Build package
    runs-on: ubuntu-24.04

    steps:
      - name: Checkout
        uses: actions/checkout@v4

      - name: OBS build script
        uses: package-building/obs-build-action@v0.0.1
        with:
          path: ./example-package
          vm-type: kvm
          dist: sl15.6
```

## Inputs

| Input          | Default   | Description                                              |
| -------------- | --------- | -------------------------------------------------------- |
| `path`         | `.`       | Path to location with package sources (e.g. spec file)   |
| `vm-type`      | `kvm`     | Type of VM to use: `chroot`, `kvm`, or `qemu`            |
| `dist`         | `sl15.6`  | Name of distribution from [known configs](https://github.com/openSUSE/obs-build/tree/20240913/configs), a filename, or an URL to config file |

Tested package formats

| Package format               | Example files in `path` folder |
| --------------               | -----------------------------  |
| rpm                          | `pgk.spec`                     |
| debian native source package | `pkg_1.0.dsc`, `pkg_1.0.tar.xz` |

## Outputs

| Output | Description             |
| ------ | ----------------------- |

## TODOs and known issues
* debian builds do not work with vm-type kvm: `Initrd file /boot/initrd is not readable.`. In OBS, the `kernel-obs-build` is installed.
* add feature to build debian source package
* build packages with recent ubuntu
* build dependent packages
* store results as outputs
* cross arch building
* repo handling (obs links, custom repos)
* vm resource configuration

## Test locally
Open in devcontainer, run
```
sudo ./test/test.sh
```
Any argument is forwarded to the `bats` engine, e.g.
```
sudo ./test/test.sh --help
sudo ./test/test.sh --filter ".*debian.*"
```
