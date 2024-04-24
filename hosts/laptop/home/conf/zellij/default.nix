{ config, pkgs, ... }:

{
    home.file."zellij" = {
        source = ./config;
        target = ".config/zellij";
        recursive = true;
    };

    programs.zellij = {
        enable = true;
    };
}
