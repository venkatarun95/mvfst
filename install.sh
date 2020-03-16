#!/bin/bash -eu

# Copyright (c) Facebook, Inc. and its affiliates.
#
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.

## Run this script to (re)install mvfst and its dependencies (fizz
## and folly). You must first compile all the dependencies before running this. This
## Usually this is done by first running `build_helper.sh`.

set -e
start_dir=$(pwd)
trap 'cd $start_dir' EXIT

# Must execute from the directory containing this script
cd "$(dirname "$0")"

cd _build
# Uninstall is expected to fail the first time
sudo make uninstall || true
sudo make install

# Make sure the libraries are available
# Linux only
sudo /sbin/ldconfig || true