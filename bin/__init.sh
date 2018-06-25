#!/usr/bin/env bash
# bin/__init.sh

# set -x
set -o errexit
set -o pipefail

SELF="$(basename "$0")"
DOTFILES="${HOME}/.dotfiles"
BIN_PATH="${DOTFILES}/bin"
if [[ ! -d "$BIN_PATH" ]] ; then exit 1; fi

# Run bin scripts
for item in "${BIN_PATH}"/*; do
	base_item="$(basename "$item")"
	if [[ -f "$item" && "$base_item" != "$SELF" ]] ; then
			bash "$item"
	fi
done
