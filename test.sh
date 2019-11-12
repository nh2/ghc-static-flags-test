#!/usr/bin/env bash

set -eu -o pipefail

GHC="$HOME/src/ghc/ghc-rtsopt-disable-lazyfree/_build/stage1/bin/ghc"

PREFIX="$PWD/installprefix"
PACKAGE_DB="$PWD/package-db.conf"

mkdir -p "$PACKAGE_DB"

(cd libpq-hs && \
  "$GHC" --make Setup.hs && \
  ./Setup configure "--with-ghc=$GHC" "--prefix=$PREFIX" "--package-db=$PACKAGE_DB" && \
  ./Setup build && \
  ./Setup install
)
# Check for expected flags
echo "Flags in" libpq-hs/dist/package.conf.inplace/libpq-hs*.conf ":"
grep -A3 -E 'library-dirs-static|extra-libraries-static' libpq-hs/dist/package.conf.inplace/libpq-hs*.conf

(cd executable && \
  "$GHC" --make Setup.hs && \
  ./Setup configure "--with-ghc=$GHC" "--prefix=$PREFIX" "--package-db=$PACKAGE_DB" --enable-executable-static && \
  ./Setup build && \
  ./Setup install
)
