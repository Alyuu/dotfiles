{ pkgs, config, lib, ... }:

{
    programs.zsh.dotDir = ".config/zsh";

    home.file."zsh-config" = {
        source = ./config;
        target = ".config/zsh";
    };
}
