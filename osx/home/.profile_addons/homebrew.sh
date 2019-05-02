#!/usr/bin/env bash

# move homebrew to home directory for gMac

# from https://g3doc.corp.google.com/company/teams/mac-road-warrior/index.md?cl=head#homebrew
# Global stuff
export PATH=$HOME/bin:$PATH
# Homebrew stuff
export PATH=$HOME/homebrew/bin:$PATH
export LD_LIBRARY_PATH=$HOME/homebrew/lib:$LD_LIBRARY_PATH

