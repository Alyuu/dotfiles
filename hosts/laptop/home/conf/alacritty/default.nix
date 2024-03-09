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
                program = "zsh";
            };

            colors = {
                primary = {
                    background = "0x282828";
                    foreground = "0xdfbf8e";
                };

                normal = {
                    black =   "0x665c54";
                    red =     "0xea6962";
                    green =   "0xa9b665";
                    yellow =  "0xe78a4e";
                    blue =    "0x7daea3";
                    magenta = "0xd3869b";
                    cyan =    "0x89b482";
                    white =   "0xdfbf8e";
                };

                bright = {
                    black =   "0x928374";
                    red =     "0xea6962";
                    green =   "0xa9b665";
                    yellow =  "0xe3a84e";
                    blue =    "0x7daea3";
                    magenta = "0xd3869b";
                    cyan =    "0x89b482";
                    white =   "0xdfbf8e";
                };
            };
        };
    };
}
