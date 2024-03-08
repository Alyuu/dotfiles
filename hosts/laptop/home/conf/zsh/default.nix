{ pkgs, config, lib, ... }:

{
    home.file = {
        source = ./config;
        target = ".config/zsh";
    };

    programs.zsh = {
        enable = true;
        dotDir = ".config/zsh";
    };
}
