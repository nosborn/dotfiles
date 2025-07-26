#!/usr/bin/env bash
set -euo pipefail

CMD="$*"

# Local Go environment setup
GOCACHE="${GOCACHE:-${HOME}/Library/Caches/go-build}"
GOMODCACHE="${GOMODCACHE:-${HOME}/go/pkg/mod}"
GOPATH="${GOPATH:-${HOME}/go}"

docker run --rm -i \
  -v "${PWD}":/app \
  -v "${GOCACHE}:/go-cache" \
  -v "${GOMODCACHE}:/go-mod-cache" \
  -v "${GOPATH}/bin:/go-bin" \
  -w /app \
  --network none \
  --read-only \
  --security-opt=no-new-privileges \
  -e GOCACHE=/go-cache \
  -e GOMODCACHE=/go-mod-cache \
  -e GOPATH=/go \
  -e GOOS=linux \
  -e GOARCH=amd64 \
  golang:1.24 \
  bash -c "${CMD}"
