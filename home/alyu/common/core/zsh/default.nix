{ pkgs, config, lib, ... }:

{
    programs = {
        zsh = {
            enable = true;
            enableCompletion = true;
            dotDir = ".config/zsh";

            # Configuration
            history = {
                size = 10000;
                path = "${config.xdg.dataHome}/zsh/history";
            };

            # Funcionalities
            autosuggestion = {
                enable = true;
            };
            syntaxHighlighting = {
                enable = true;
            };
            
            # Aliases
            shellAliases = {
                ls = "eza --icons";
                nr = "sudo nixos-rebuild switch --flake";
            };

            initExtra = ''
                function yy() {
                    local tmp="$(mktemp -t "yazi-cwd.XXXXX")"
                    yazi "$@" --cwd-file="$tmp"
                    if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
                        cd -- "$cwd"
                    fi
                    rm -f -- "$tmp"
                }

                source ${pkgs.zsh-vi-mode}/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh                
            '';

        };

        # Prompt
        starship = {
            enable = true;
            enableZshIntegration = true;
            
            settings = {
                add_newline = false;

                format = lib.concatStrings [
                    "$os"
                    "$username"
                    "$directory"
                    "$cmd_duration"
                    "$fill"
                    "$git_branch"
                    "$git_status"
                    "$time"
                    "$line_break"
                    "$character"
                ];

                palette = "gruvbox";

                palettes.gruvbox = {
                    color_fg = "#EBDBB2";
                    color_bg = "#282828";
                    color_bg1 = "#3C3836";
                    color_bg3 = "#665c54";
                    color_bg4 = "#7C6F64";
                    color_gray = "#928374";
                    color_aqua = "#8EC07C";
                    color_aqua_dark = "#689D6A";
                    color_red = "#FB4934";
                    color_green = "#B8BB26";
                    color_green_dark = "#98971A";
                    color_yellow = "#FABD2F";
                    color_blue = "#83A598";
                    color_blue_dark = "#458588";
                };
                
                character = {
                    success_symbol = "[λ](bold fg:color_aqua)";
                    error_symbol = "[λ](bold fg:color_red)";
                    vimcmd_symbol = "[](bold fg:color_aqua)";
                    vimcmd_visual_symbol = "[](bold fg:color_yellow)";
                };

                line_break.disabled = false;

                os = {
                    disabled = false;
                    symbols.NixOS = "";
                    style = "bold fg:color_bg bg:color_aqua";
                    format = "[ $symbol ]($style)";
                };

                username = {
                    show_always = true;
                    style_user = "bold fg:color_bg bg:color_aqua";
                    style_root = "fg:color_red";
                    format = "[$user ]($style)";
                };

                directory = {
                    style = "fg:color_fg bg:color_bg3";
                    format = "[ $path ]($style)";
                    truncation_length = 3;
                    truncation_symbol = ".../";
                };
                
                cmd_duration = {
                    style = "fg:color_fg bg:color_bg1";
                    format = "[ 󰔟 $duration ]($style)";
                };

                git_branch = {
                    symbol = "";
                    style = "fg:color_fg bg:color_bg1";
                    format = "[ $symbol $branch ]($style)";
                };

                git_status = {
                    style = "fg:color_fg bg:color_bg1";
                    format = "[$all_status$ahead_behind ]($style)";
                };

                time = {
                    disabled = false;
                    time_format = "%R";
                    style = "fg:color_fg bg:color_bg3";
                    format = "[ $time ]($style)";
                };
            };
        };

        # Plugins
        eza = {
            enable = true;
            enableZshIntegration = true;
        };

        bat = {
            enable = true;
            extraPackages = with pkgs.bat-extras; [
                batgrep
                batman
            ];
        };

        fzf = {
            enable = true;
            enableZshIntegration = true;
        };

        btop = {
            enable = true;
        };
        
        zoxide = {
            enable = true;
            enableZshIntegration = true;
        };
    };

    # Shell plugins
    home.packages = with pkgs; [
        tldr
        fd
        libnotify
    ];
}
