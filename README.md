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

Here's an example of how to use this action in a workflow file:


```yaml
name: Example Workflow

on:
  workflow_dispatch:

jobs:
  build-package:
    name: Build package
    runs-on: ubuntu-latest

    steps:
      # Change @main to a specific commit SHA or version tag, e.g.:
      # actions/obs-build-action@e76147da8e5c81eaf017dede5645551d4b94427b
      # actions/obs-build-action@v1.2.3
      - name: Build package
        uses: actions/obs-build-action@main
        with:
          path: ./path_to_package_sources
          vm-type: kvm
          dist: sl15.6
```

For example workflow runs, check out the
[Actions tab](https://github.com/actions/obs-build-action/actions)!
:rocket:

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
