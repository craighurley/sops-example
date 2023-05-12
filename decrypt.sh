#!/usr/bin/env bash

set -e

sops -d sops.test.env > test.env
sops -d sops.test.json > test.json
sops -d sops.test.yaml > test.yaml

exit 0
