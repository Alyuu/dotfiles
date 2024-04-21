{ config, lib, pkgs, ... }:

{
    programs.direnv = {
        enable = true;
        enableZshIntegration = true;
        nix-direnv.enable = true;
        config = {
            global = {
                disable_stdin = true;
            };
        };
    };
}