{ pkgs, ... }:
let
    tmux-gruvbox = pkgs.tmuxPlugins.mkTmuxPlugin
        {
            pluginName = "tmux-gruvbox";
            rtpFilePath = "tmux-gruvbox.tmux";
            version = "unstable-2024-09-11";
            src = pkgs.fetchFromGitHub {
                owner = "Alyuu";
                repo = "tmux-gruvbox";
                rev = "590b704f2b41ae689bd7cfab89fc40f282a32640";
                sha256 = "sha256-Dw1DLIxPT3vrwdu3tzTVvaQnV2dNeFrcB80Vij/bg7A=";
            };
        };
in
{
    programs.tmux = {
        enable = true;
        shell = "${pkgs.zsh}/bin/zsh";
        terminal = "kitty";
        shortcut = "a";
        keyMode = "vi";
        mouse = true;
        clock24 = true;
        historyLimit = 10000;
        plugins = with pkgs; [
            {
                plugin = tmux-gruvbox;
            }
        ];
        extraConfig = ''
            set-option -ga terminal-overrides ",kitty:Tc"
            bind -n M-Left select-pane -L
            bind -n M-Right select-pane -R
            bind -n M-Up select-pane -U
            bind -n M-Down select-pane -D
            bind -n M-S-Left resize-pane -L
            bind -n M-S-Right resize-pane -R
            bind -n M-S-Up resize-pane -U
            bind -n M-S-Down resize-pane -D
            bind r source-file ~/.config/tmux/tmux.conf
        '';
    };
}
