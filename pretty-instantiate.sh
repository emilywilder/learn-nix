#!/usr/bin/env bash

nix-instantiate --eval --strict $* | nixfmt