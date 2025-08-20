#!/usr/bin/env bash
set -e

if [[ "$GITHUB_REF" == refs/tags/* ]]; then
    # Extract version from tag (remove 'v' prefix if present)
    tag="${GITHUB_REF#refs/tags/}"
    export PKG_VER="${tag#v}"
    export BUILD_VER="$PKG_VER"
else
    # Get the latest Git tag, default to v0.0.0 if none
    cv=$(git describe --abbrev=0 2>/dev/null || echo "v0.0.0")
    cv=${cv#v}
    major=$(echo "$cv" | cut -d. -f1)
    minor=$(echo "$cv" | cut -d. -f2)
    minor=$((minor + 1))
    export PKG_VER="${major}.${minor}.0"
    export BUILD_VER="${PKG_VER}+${GITHUB_RUN_NUMBER}"
fi

export PYPI_VER="${BUILD_VER/+/.dev}"

echo "PKG_VER=$PKG_VER"
echo "BUILD_VER=$BUILD_VER"
echo "PYPI_VER=$PYPI_VER"

# Make variables available to later workflow steps
echo "PKG_VER=$PKG_VER" >> $GITHUB_ENV
echo "BUILD_VER=$BUILD_VER" >> $GITHUB_ENV
echo "PYPI_VER=$PYPI_VER" >> $GITHUB_ENV
