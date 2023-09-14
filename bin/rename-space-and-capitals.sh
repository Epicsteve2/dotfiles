#!/bin/bash

set -eu -o pipefail

for f in *; do echo mv -v "$f" "${f// /-}"; done
for f in *; do echo mv -v "$f" "$(echo "$f" | tr '[:upper:]' '[:lower:]')"; done
