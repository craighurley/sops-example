#!/usr/bin/env bash

set -e

sops -d --output test.env sops.test.env
sops -d --output test.json sops.test.json
sops -d --output test.yaml sops.test.yaml

exit 0
