{
    programs.kitty = {
        enable = true;
        shellIntegration.enableZshIntegration = true;

        font = {
            name = "FantasqueSansMNerdFontMono";
            size = 13;
        };

        theme = "Gruvbox Dark";

        settings = {
            scrollback_lines = 10000;
            window_padding_width = 15;
        };
    };
}
