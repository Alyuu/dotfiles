{ pkgs, config, ... }:
{
    home.packages = with pkgs; [
        rofi-wayland
    ];

    home.file."rofi" = {
        source = ./config;
        target = ".config/rofi";
        recursive = true;
    };
}
