{ pkgs, ... }:
{
    programs.ags = {
        enable = true;

        configDir = ./config;

        # additional packages to add to GJS's runtime
        extraPackages = with pkgs; [
            gtksourceview
                webkitgtk
                accountsservice
        ];
    };
}
