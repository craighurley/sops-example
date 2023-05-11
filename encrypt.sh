#!/usr/bin/env bash

set -e

sops -e --output sops.test.env test.env
sops -e --output sops.test.json test.json
sops -e --output sops.test.yaml test.yaml

exit 0
