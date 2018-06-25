#!/usr/bin/env bash
# based on: https://github.com/necolas/dotfiles/

# set -x
set -o errexit
set -o pipefail

TARGET="$1"
DOTFILES="${HOME}/.dotfiles"
if [[ ! -d "$DOTFILES" ]] ; then exit 1; fi
if [[ -f "${DOTFILES}/utils" ]] ; then source "${DOTFILES}/utils"; else exit 1; fi

case "$TARGET" in
    all)
        e_header "Running scripts in bin..."
        bin/__init.sh
        e_header "Creating symbolic links..."
        bin/__init.sh
        ;;
    bin)
        e_header "Running scripts in bin..."
        bin/__init.sh
        ;;
    shell)
        e_header "Creating symbolic links..."
        bash bin/__init.sh
        ;;
    *)
        e_header "ERROR - This script requires an argument of 'all', 'bin', or 'shell'"
        ;;
esac