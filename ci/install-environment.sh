#!/bin/bash

set -e

export PATH="${HOME}/edm/bin:${PATH}"

# Basic EDM setup for edm_driver.py script
edm install -y wheel click
# Install a separate environment with blend2d
edm run -- python ci/edm_driver.py install --runtime=${RUNTIME_VERSION}
