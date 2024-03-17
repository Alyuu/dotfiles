{ config, pkgs, lib, ... }:

{
    home.packages = with pkgs; [
        ffmpegthumbnailer
        unar
        jq
        poppler
        fd
        rg
    ];
}
