#!/bin/bash

set -e

export PATH="${HOME}/edm/bin:${PATH}"

# Run the tests from the ci directory
pushd ci
edm run -- python edm_driver.py test --runtime=${RUNTIME_VERSION}
popd
