#!/bin/bash

DOTFILES=$( dirname -- $( readlink -f -- "$0"; ); )

function install-config() {
    if [[ "$1" =~ ^\/.* ]]; then
        echo "ERROR: Input path $1 cannot be an absolute path"; return 1
    fi
    if [[ ! "$2" =~ ^\/.* ]]; then
        echo "ERROR: Output path $2 must be an absolute path"; return 1
    fi
    if [[ ! -e "$DOTFILES/$1" ]]; then
        echo "ERROR: Input path $1 does not exist"; return 1
    fi
    if [[ ! -L "$2" ]] && ([[ -f "$2" ]] || [[ -d "$2" ]]); then
        echo "ERROR: Configuration at output path $2 already exists"; return 1
    fi
    outdir=$(dirname "$2")
    if [[ ! -d "$outdir" ]]; then
        mkdir -p "$outdir"
    fi
    ln -sf "$DOTFILES/$1" "$2"
    echo "$1 -> $2"
}

install-config ".zshrc" "$HOME/.zshrc"
install-config "alacritty.toml" "$HOME/.config/alacritty/alacritty.toml"
install-config "nvim" "$HOME/.config/nvim"
