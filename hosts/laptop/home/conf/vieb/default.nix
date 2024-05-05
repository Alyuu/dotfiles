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

    xdg.desktopEntries = {
        vieb = {
            categories = [ "Application" "Network" "WebBrowser" ];
            exec = "vieb %U";
            genericName = "Web Browser";
            icon = "vieb";
            mimeType = [ "text/html" "application/xhtml+xml" "x-scheme-handler/https" ];
            name = "Vieb";
            type = "Application";
        };
    };
}
