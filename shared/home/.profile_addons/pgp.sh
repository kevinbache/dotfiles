#!/usr/bin/env bash

# for PGP
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"


export LDFLAGS="-L/usr/local/opt/icu4c/lib:$LDFLAGS"
export CPPFLAGS="-I/usr/local/opt/icu4c/include:$LDFLAGS"

export PKG_CONFIG_PATH="/usr/local/opt/icu4c/lib/pkgconfig:$PKG_CONFIG_PATH"