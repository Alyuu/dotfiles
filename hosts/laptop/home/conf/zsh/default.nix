{ pkgs, config, lib, ... }:

{
    home.file."zsh-config" = {
        source = ./config;
        target = ".config/zsh";
    };
}
