{ config, lib, pkgs, /* pkgs-stable,  */inputs, outputs, configLib, ... }:

{
  imports = [
    ./git.nix
    ./godot.nix
    ./fonts.nix
    ./alacritty.nix
    ./kitty.nix
    ./yazi.nix
    ./gtk.nix
    ./qt.nix
    ./zsh
    ./icons.nix
    ./ssh.nix
    ./spicetify.nix
    # ./zellij/zellij.nix
    ./waybar.nix
    ./rofi
    ./quickshell
    # ./cava.nix
    ./fastfetch.nix
    ./tmux.nix
  ]
  ++ (builtins.attrValues outputs.home-manager-modules);

  home = {
    username = lib.mkDefault "alyu";
    stateVersion = lib.mkDefault "24.05";
    homeDirectory = lib.mkDefault "home/alyu";
    sessionVariables = {
      SHELL = "zsh";
      TERM = "kitty";
      TERMINAL = "kitty";
      EDITOR = "nvim";
      MANPAGER = "batman";
    };
  };

  home.packages = with pkgs; [
    inputs.alyuu-nixvim.packages.${pkgs.system}.default
    fzf
    ripgrep
    alacritty
    kitty
    yazi
    wofi
    vesktop
    bottles
    inkscape
    vlc
    grim
    slurp
    wl-clipboard
    yt-dlp
    zip
    unzip
    krita
    gimp
    libreoffice-qt
    hunspell
    hunspellDicts.es_ES
    gleam
    erlang_26
    rebar3
    prismlauncher
    brave
    imagemagick
    nix-prefetch-github
    flyctl
  ];

  programs = {
      home-manager.enable = true;
  };

  # xdg.desktopEntries.vesktop = {
  #     name = "Vesktop";
  #     genericName = "Internet Messenger";
  #     exec = "vesktop --ozone-platform-hint=auto %U";
  #     icon = "vesktop";
  #     categories = [ "Network" "InstantMessaging" "Chat" ];
  #     type = "Application";
  # };
}
