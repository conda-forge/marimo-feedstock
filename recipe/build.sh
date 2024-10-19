#!/bin/bash

## remove copilot
rm -rf marimo/_lsp

## build
${PYTHON} -m pip install . -vv --no-deps --no-build-isolation
