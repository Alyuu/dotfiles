{ config, pkgs, ... }:

{
    home.packages = with pkgs; [
        zellij
    ];

    home.file."zellij-config" = {
        source = ./config;
        target = ".config/zellij";
    }
}
