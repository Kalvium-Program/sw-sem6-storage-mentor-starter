#!/usr/bin/env bash
# Starts the ledger with NO volume. Records are lost when this container is removed.
set -eu
docker run -d --name checkout-loose storage-demo:v1
