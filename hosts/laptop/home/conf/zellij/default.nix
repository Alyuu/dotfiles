{ config, pkgs, ... }:

{
    home.file."zellij" = {
        source = ./config;
        target = ".config/zellij";
        recursive = true;
    };

    programs.zellij = {
        enable = true;

        settings = {
            pane_frames = false;
            default_layout = "compact";

            enableZshIntegration = true;
            default_shell = "zsh";
        };
    };
}
