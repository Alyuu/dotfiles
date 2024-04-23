{ config, pkgs, lib, ... }:

{
    programs.foot = {
        enable = true;

        settings = {
            main = {
                shell = "zsh";

                font = "FantasqueSansMNerdFontMono:size=14";
                pad = "30x10";
            };
            colors = {
                alpha = "1.0";
                foreground = "ebdbb2";
                background = "282828";
                regular0 = "282828"; # black
                regular1 = "cc241d"; # red
                regular2 = "98971a"; # green
                regular3 = "d79921"; # yellow
                regular4 = "458588"; # blue
                regular5 = "b16286"; # magenta
                regular6 = "689d6a"; # cyan
                regular7 = "a89984"; # white
                bright0 = "928374"; # bright black
                bright1 = "fb4934"; # bright red
                bright2 = "b8bb26"; # bright green
                bright3 = "fabd2f"; # bright yellow
                bright4 = "83a598"; # bright blue
                bright5 = "d3869b"; # bright magenta
                bright6 = "8ec07c"; # bright cyan
                bright7 = "ebdbb2"; # bright white
                # 16 = <256-color palette #16>
                # ...
                # 255 = <256-color palette #255>
                # selection-foreground=<inverse foreground/background>
                # selection-background=<inverse foreground/background>
                # jump-labels=<regular0> <regular3>
                # urls=<regular3>
                # scrollback-indicator=<regular0> <bright4>
            };
        };
    };
}
