{ pkgs, ... }:

{
    home.packages = with pkgs; [
        icon-library
        adwaita-icon-theme
    ];
}
