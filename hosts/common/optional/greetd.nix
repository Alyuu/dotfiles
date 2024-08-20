{ config, pkgs, lib, ...}:
{
    services.greetd = {
        enable = true;
        restart = true;
        vt = 3;
        settings = {
            default_session = {
                command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
                user = "greeter";
            };
        };
    };

    environment.systemPackages = with pkgs; [
        greetd.tuigreet
    ];
}
