{ pkgs, ... }:
{
    programs.zellij = {
        enable = true;
    };

    home.file."zellij" = {
        source = ./config;
        target = ".config/zellij";
        recursive = true;
    };
}
