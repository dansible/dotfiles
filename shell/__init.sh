#!/usr/bin/env bash
# shell/__init.sh

# set -x
set -o errexit
set -o pipefail

SELF="$(basename "$0")"
DOTFILES="${HOME}/.dotfiles"
SHELL_PATH="${DOTFILES}/shell"

# output to a directory if an argument is provided
if [[ -n "$1" ]]  ; then OUTPATH="$1" ; else OUTPATH="$HOME" ; fi

# exit if OUTPATH doesn't exist / isn't a dir
if [[ ! -d "$OUTPATH" ]] ; then echo "not a dir" && exit 1; fi

e_header "Creating shell symlinks..."

# add aliases for dotfiles
for item in "${SHELL_PATH}"/*; do
	base_item="$(basename "$item")"
	if [[ -f "$item" && "$base_item" != "$SELF" ]] ; then
			ln -sfn "$item" "${OUTPATH}/.${base_item}"
	fi
done