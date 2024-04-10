{ config, pkgs, lib, ... }:

{
    programs = {
        enable = true;

        settings = {
            main = {
                term = "xterm-256color";

                font = "JetBrainsMono:size=12";
                dpi-aware = "yes";
            };
        };
    }
}
