{
    programs.kitty = {
        enable = true;
        shellIntegration.enableZshIntegration = true;

        font = {
            name = "FantasqueSansMNerdFontMono";
            size = 13;
        };

        theme = "Alyu Theme";

        settings = {
            scrollback_lines = 10000;
            window_padding_width = 15;
        };
    };

    home.file."kitty" = {
        source = ./config;
        target = ".config/kitty";
        recursive = true;
    };
}
