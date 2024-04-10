{ config, pkgs, lib, ... }:

{
    programs.foot = {
        enable = true;

        settings = {
            main = {
                shell = "zsh";

                font = "JetBrainsMonoNerdFont:size=12";
            };
        };
    };
}
