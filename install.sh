#!/bin/bash

DOTFILES=$( dirname -- $( readlink -f -- "$0"; ); )

if command -v fc-list >/dev/null 2>&1; then
    if [ -z $(fc-list "SauceCodePro Nerd Font") ]; then
        echo >&2 "WARN: SauceCodePro Nerd Font not found."
        exit 1;
    fi
else
    echo >&2 "WARN: Command fc-list not found. Font checking will not be performed.";
    exit 1;
fi

if ! command -v wl-copy >/dev/null 2>&1 && ! command -v xclip >/dev/null 2>&1; then
    echo >&2 "WARN: wl-clipboard or xclip not installed."
fi

function install-config() {
    if [[ "$1" =~ ^\/.* ]]; then
        echo >&2 "ERROR: Input path $1 cannot be an absolute path"; return 1
    fi
    if [[ ! "$2" =~ ^\/.* ]]; then
        echo >&2 "ERROR: Output path $2 must be an absolute path"; return 1
    fi
    if [[ ! -e "$DOTFILES/$1" ]]; then
        echo >&2 "ERROR: Input path $1 does not exist"; return 1
    fi
    if [[ ! -L "$2" ]] && ([[ -f "$2" ]] || [[ -d "$2" ]]); then
        echo >&2 "ERROR: Configuration at output path $2 already exists"; return 1
    fi
    outdir=$(dirname "$2")
    if [[ ! -d "$outdir" ]]; then
        mkdir -p "$outdir"
    fi
    ln -sfnT "$DOTFILES/$1" "$2"
    echo "$1 -> $2"
}

install-config ".zshrc" "$HOME/.zshrc"
install-config ".gitconfig" "$HOME/.gitconfig"
install-config "alacritty.toml" "$HOME/.config/alacritty/alacritty.toml"
install-config "nvim" "$HOME/.config/nvim"
