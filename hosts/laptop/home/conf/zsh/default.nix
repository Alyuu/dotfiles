{ pkgs, config, lib, ... }:

{
    # Set zsh config
    # home.file."zsh-config" = {
    #     source = ./config;
    #     target = ".config/zsh";
    # };

    # home.activation = {
    #     zshConfig = ''
    #         mkdir -p ${config.home.homeDirectory}/.config/zsh
    #         shopt -s dotglob
    #         cp -r --preserve=all ${toString ./config}/* ${config.home.homeDirectory}/.config/zsh
    #         chmod -R +w ${config.home.homeDirectory}/.config/zsh
    #     '';
    # };

    # Set zsh config location
    # home.file.".zshenv" = {
    #     text = "ZDOTDIR=$HOME/.config/zsh";
    # };

    # Load plugins
    # home.file = {
    #     ".local/share/zsh/zsh-powerlevel10k".source = "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k";
    #     ".local/share/zsh/zsh-autosuggestions".source = "${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions";
    #     ".local/share/zsh/zsh-fast-syntax-highlighting".source = "${pkgs.zsh-fast-syntax-highlighting}/share/zsh/site-functions";
    #     #".local/share/zsh/nix-zsh-completions".source = "${pkgs.nix-zsh-completions}/share/zsh/plugins/nix";
    #     #".local/share/zsh/zsh-vi-mode".source = "${pkgs.zsh-vi-mode}/share/zsh-vi-mode";
    # };

    programs = {
        zsh = {
            enable = true;
            enableCompletion = true;

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
                nr = "sudo nixos-rebuild switch --flake ~/nixos/#laptop";
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
                    "$line_break"
                    "$character"
                ];

                right_format = lib.concatStrings [
                    "$git_branch"
                    "$git_status"
                    "$time"
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
                    style = "bold fg:color_fg bg:color_bg3";
                    format = "[ $path ]($style)";
                    truncation_length = 3;
                    truncation_symbol = ".../";
                };
                
                cmd_duration = {
                    style = "bold fg:color_fg bg:color_bg1";
                    format = "[ 󰔟 $duration ]($style)";
                };

                git_branch = {
                    symbol = "";
                    style = "bold fg:color_fg bg:color_bg1";
                    format = "[ $symbol $branch ]($style)";
                };

                git_status = {
                    style = "bold fg:color_fg bg:color_bg1";
                    format = "[$all_status$ahead_behind ]($style)";
                };

                time = {
                    disabled = false;
                    time_format = "%R";
                    style = "bold fg:color_fg bg:color_bg3";
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
        # eza
        # bat
        # fzf
        # btop
        tldr
        # zoxide
    ];
}
