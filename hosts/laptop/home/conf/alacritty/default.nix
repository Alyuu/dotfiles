{ config, pkgs, lib, ... }: 

{
    home.packages = lib.optionals config.programs.alacritty.enable [pkgs.nerdfonts];

    programs.alacritty = {
        enable = true;

        settings = {
            font = {
                bold = {
                    family = "JetBrainsMono Nerd Font Mono";
                    style = "Bold";
                };
                bold_italic = {
                    family = "JetBrainsMono Nerd Font Mono";
                    style = "Bold Italic";
                };
                italic = {
                    family = "JetBrainsMono Nerd Font Mono";
                    style = "Italic";
                };
                normal = {
                    family = "JetBrainsMono Nerd Font Mono";
                    style = "Regular";
                };
                size = 12;
            };

            window = {
                padding = {
                    x = 12;
                    y = 12;
                };
            };
            shell = {
                program = "/usr/bin/env zsh";
            };
        };
    };
}
