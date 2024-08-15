{ pkgs, ... }:

{
        environment.systemPackages = with pkgs; [
            lutris
            heroic
            mangohud
            protonup
        ];

        programs.steam = {
            enable = true;
            gamescopeSession.enable = true;
        };

        programs.gamemode.enable = true;
}
