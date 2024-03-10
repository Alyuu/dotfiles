{ config, pkgs, ... }:

{
    home.packages = with pkgs; [
        zellij
    ];

    # home.file."zellij-config" = {
    #     source = ./config;
    #     target = ".config/zellij";
    # };

    home.activation = {
        zellijConfig = ''
            mkdir -p ${config.home.homeDirectory}/.config/zellij
            cp -r --preserve=all ${toString ./config}/* ${config.home.homeDirectory}/.config/zellij
            chmod -R +w ${config.home.homeDirectory}/.config/zellij
        '';
    };
}
