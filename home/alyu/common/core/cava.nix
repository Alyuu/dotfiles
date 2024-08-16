{ pkgs, ...}:
{
    programs.cava = {
        enable = true;
        settings = {
            general.framerate = 60;
            color = {
                background = "'#282828'";
                foreground = "'#8EC07C'";
            };
        };
    };
}
