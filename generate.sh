#!/usr/bin/env bash
# Generate a typed Python client for the OFMAPI OnlyFans API from the public
# OpenAPI 3.1 spec. Output lands in ./ofmapi-client (git-ignored).
#
#   ./generate.sh
#   pip install -e ./ofmapi-client
#
# Walkthrough with usage examples: https://ofmapi.com/docs/sdk/python
set -euo pipefail

pip install --quiet --upgrade openapi-python-client
rm -rf ofmapi-client
openapi-python-client generate \
  --url https://ofmapi.com/openapi.json \
  --meta poetry \
  --output-path ofmapi-client

echo "generated ./ofmapi-client — install with: pip install -e ./ofmapi-client"
