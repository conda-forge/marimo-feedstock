#!/bin/bash
set -euxo pipefail

## build
${PYTHON} -m pip install . -vv --no-deps --no-build-isolation

## menu (menuinst)
mkdir -p "$PREFIX/Menu"
sed "s/__PKG_VERSION__/$PKG_VERSION/" "$RECIPE_DIR/menu.json" > "$PREFIX/Menu/marimo-menu.json"
cp "$RECIPE_DIR/marimo.png" "$PREFIX/Menu/"
if [[ "$OSTYPE" == "darwin"* ]]; then
    cp "$RECIPE_DIR/marimo.icns" "$PREFIX/Menu/"
fi
