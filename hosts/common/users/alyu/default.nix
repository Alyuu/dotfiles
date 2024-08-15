{ pkgs, inputs, config, lib, configLib, ... }:

{

  users.users.alyu = {
    isNormalUser = true;
    description = "Alyu";
    extraGroups = [ "wheel" "networkmanager" "git" "docker" "libvirtd" ];

    shell = pkgs.zsh;
  };

  home-manager.users.alyu = import (configLib.relativeToRoot "home/alyu/${config.networking.hostName}.nix");

  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/alyu/.steam/root/compatibilitytools.d";
  };

  programs.zsh.enable = true;
  programs.git.enable = true;

  virtualisation.docker.enable = true;

}
