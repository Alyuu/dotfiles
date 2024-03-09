#!/bin/sh

# history
HISTFILE=~/.cache/zsh/history

# source
[ -f "$HOME/.config/zsh/aliases.zsh" ] && source "$HOME/.config/zsh/aliases.zsh"
[ -f "$HOME/.config/zsh/exports.zsh" ] && source "$HOME/.config/zsh/exports.zsh"

# prompt
[ -f "$HOME/.config/zsh/.p10k.zsh" ] && source "$HOME/.config/zsh/.p10k.zsh"

# plugins

# keybinds
# bindkey '^ ' autosuggest-accept

export PATH="$HOME/.local/bin":$PATH
