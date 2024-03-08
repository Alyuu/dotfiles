#!/bin/sh

# history
HISTFILE=~/.cache/zsh/history

# source
[ -f "$HOME/.config/zsh/aliases.zsh" ] && source "$HOME/.config/zsh/aliases.zsh"
[ -f "$HOME/.config/zsh/exports.zsh" ] && source "$HOME/.config/zsh/exports.zsh"

# plugins

# keybinds
# bindkey '^ ' autosuggest-accept

export PATH="$HOME/.local/bin":$PATH
