{ pkgs, config, lib, ... }:

{
    home.file."zsh-config" = {
        source = ./config;
        target = ".config/zsh";
    };

    home.file.".zshenv" = {
        text = "ZDOTDIR=$HOME/.config/zsh";
    };
}
