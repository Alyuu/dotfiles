#!/bin/sh

# colors
autoload -U colors && colors

# history
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# source
[ -f "$HOME/.config/zsh/aliases.zsh" ] && source "$HOME/.config/zsh/aliases.zsh"
[ -f "$HOME/.config/zsh/exports.zsh" ] && source "$HOME/.config/zsh/exports.zsh"
[ -f "$HOME/.config/zsh/functions.zsh" ] && source "$HOME/.config/zsh/functions.zsh"

# Prompt
[ -f "$HOME/.config/zsh/.p10k.zsh" ] && source "$HOME/.config/zsh/.p10k.zsh"

# plugins
add_plugin "zsh-powerlevel10k/powerlevel10k.zsh-theme"
add_plugin "zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"
add_plugin "zsh-autosuggestions/zsh-autosuggestions.zsh"

# keybinds
bindkey '^y' autosuggest-accept

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

export PATH="$HOME/.local/bin":$PATH
eval "$(zoxide init zsh)"
