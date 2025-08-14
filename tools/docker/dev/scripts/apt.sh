#!/bin/bash

# deps
apt-get update && apt-get install -y git curl

# taskfile
sh -c "$(curl --location https://taskfile.dev/install.sh)" -- -d -b /bin