{ inputs, pkgs, ... }:
{
    home.packages = [
        inputs.quickshell.packages.${pkgs.system}.default
    ];

    home.file."quickshell" = {
        source = ./config;
        target = ".config/quickshell";
        recursive = true;
    };
}
