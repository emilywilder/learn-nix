#! /usr/bin/env nix-shell
#shellcheck shell=bash
#! nix-shell -i zsh -p libxml2 htmlq

URL="https://nix.dev/manual/nix/2.28/language/builtins.html"
XPATH="//a[starts-with(@href, '#builtin')]/code"

curl --silent "${URL}" | xmllint --html --xpath "${XPATH}" - | htmlq -t
