#!/bin/sh

set -e

if [ -z "$INPUT_SOURCE_DIR" ]; then
  echo "source directory is not set. Quitting."
  exit 1
fi

if [ -z "$INPUT_CONTAINER_NAME" ]; then
  echo "storage account container name is not set. Quitting."
  exit 1
fi

if [ -z "$INPUT_CONNECTION_STRING" ]; then
  echo "storage account connection string is not set. Quitting."
  exit 1
fi

EXTRA_ARGS=${INPUT_EXTRA_ARGS:""}

VERB="upload-batch"
CONTAINER_NAME_FLAG="--destination"
if [ -z "$INPUT_SYNC" ]; then
  VERB="sync"
  CONTAINER_NAME_FLAG="--container"
fi
az storage blob ${VERB} --debug --connection-string ${INPUT_CONNECTION_STRING} --source ${INPUT_SOURCE_DIR} ${CONTAINER_NAME_FLAG} ${INPUT_CONTAINER_NAME} ${EXTRA_ARGS}
