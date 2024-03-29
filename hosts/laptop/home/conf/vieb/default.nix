{ config, pkgs, lib, ... }: 

{
    # home.file."vieb-config" = {
    #     source = ./config;
    #     target = ".config/Vieb";
    #     recursive = true;
    # };
    
    home.activation = {
        viebConfig = ''
            mkdir -p ${config.home.homeDirectory}/.config/Vieb
            cp -r --preserve=all ${toString ./config}/* ${config.home.homeDirectory}/.config/Vieb
            chmod -R +w ${config.home.homeDirectory}/.config/Vieb
        '';
    };
}
