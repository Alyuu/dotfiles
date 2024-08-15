{ pkgs, lib, config, ... }:

{
  programs.git = {
    enable = true;
    lfs.enable = true;
    package = pkgs.gitAndTools.gitFull;
    userName = "Alyuu";
    userEmail = "alejandro.yusesc@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
      # url = {
      #   "ssh://git@github.com" = {
      #     insteadOf = "https://github.com";
      #   };
      # };
    };
  };
}
