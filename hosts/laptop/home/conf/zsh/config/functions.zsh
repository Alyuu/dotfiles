function add_plugin() {
    [ -f "$HOME/.local/share/zsh/$1" ] && source "$HOME/.local/share/zsh/$1"
}
