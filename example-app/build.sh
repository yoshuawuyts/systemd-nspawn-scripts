#!/bin/bash -e
# Adapted from https://github.com/containers/build/blob/master/examples/nodejs/build-nodejs.sh

if [ "$EUID" -ne 0 ]; then
  echo "This script uses functionality which requires root privileges"
  exit 1
fi

# Set file references
__filename="$(readlink -f "$0")"
__dirname="$(dirname "$__filename")"

# Configuration
VERSION="1.0.0"
NAME="my-node-service-${VERSION}"
OUTDIR="${HOME}/images"
NODE_VERSION="6"

# Create directories
mkdir -p "$OUTDIR"

# Start acbuild, clean up on exit
acbuild begin "docker://mhart/alpine-node:${NODE_VERSION}"
trap '{ export EXT=$?; acbuild end && exit $EXT; }' EXIT

# Build
acbuild set-name "$NAME"
acbuild run -- apk update
acbuild environment add PORT 80
acbuild port add http tcp 80
acbuild copy "${__dirname}/index.js" /var/www/index.js
acbuild set-exec -- /usr/bin/node /var/www/index.js
acbuild write --overwrite "${OUTDIR}/${NAME}.aci"

echo "Created ${OUTDIR}/${NAME}.aci"
