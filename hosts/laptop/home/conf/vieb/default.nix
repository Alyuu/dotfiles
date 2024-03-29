{ config, pkgs, lib, ... }: 

{
    home.file."vieb-config" = {
        source = ./config;
        target = ".config/Vieb";
    };
}
