{ config, lib, pkgs, ... }:

{
    qt = {
        enable = true;
        platformTheme.name = "gtk";
        style = {
            name = "adwaita-dark";
        };
    };

    home.sessionVariables = {
      QT_STYLE_OVERRIDE = "adwaita-dark";
    };

    home.packages = with pkgs; [
        adwaita-qt
    ];
}
