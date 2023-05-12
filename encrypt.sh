#!/usr/bin/env bash

set -e

sops -e test.env > sops.test.env
shred -z --remove test.env
sops -e test.json > sops.test.json
shred -z --remove test.json
sops -e test.yaml > sops.test.yaml
shred -z --remove test.yaml

exit 0
