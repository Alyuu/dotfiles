{ config, pkgs, lib, ... }:

{
    programs.foot = {
        enable = true;

        settings = {
            main = {
                term = "xterm-256color";

                font = "JetBrainsMonoNerdFont:size=12";
            };
        };
    };
}
