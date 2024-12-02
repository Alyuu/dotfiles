{ pkgs, ... }:

{
    fonts.fontconfig.enable = true;
    home.packages = with pkgs; [
      font-awesome
        nerd-fonts.fantasque-sans-mono
    ];
}
