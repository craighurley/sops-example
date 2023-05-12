#!/usr/bin/env bash

set -e

sops -e test.env > sops.test.env
sops -e test.json > sops.test.json
sops -e test.yaml > sops.test.yaml

exit 0
