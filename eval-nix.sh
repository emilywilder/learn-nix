#!/bin/sh

if [ -n "$1" ]; then
  nix-instantiate --eval "$@"
else
  echo "usage: $0 <filename.nix>" >&2
  exit 1
fi
