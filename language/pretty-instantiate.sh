#!/bin/bash

[ "$*" ] && nix-instantiate --eval --strict $* | nixfmt
exit $?
