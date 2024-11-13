{
    programs.kitty = {
        enable = true;
        shellIntegration.enableZshIntegration = true;

        font = {
            name = "FantasqueSansMNerdFontMono";
            size = 13;
        };

        themeFile = "Gruvbox Dark";

        settings = {
            scrollback_lines = 10000;
            window_padding_width = 15;
        };
        extraConfig = ''
            foreground #dee6b8
            background #171a18
            color0  #171a18
            color8  #738c73
            color1  #992e26
            color9  #e65545
            color2  #80994d
            color10 #99bf4d
            color3  #d65d0e
            color11 #fe8019
            color4  #458588
            color12 #83a598
            color5  #b16286
            color13 #d3869b
            color6  #679967
            color14 #8ec07c
            color7  #8aa88a
            color15 #dee6b8
            cursor  #dee6b8
            cursor_text_color #171a18
            selection_foreground #171a18
            selection_background #dee6b8
        '';
    };
}
