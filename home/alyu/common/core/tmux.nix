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
                rev = "119cf899190bdac4944ae59e3d3cdae249588c71";
                sha256 = "sha256-emwNSwDxKFHxBk/BAQP+ukxGv6FwfXykDmEf+8r43DQ=";
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
            bind r source-file ~/.config/tmux/tmux.conf
        '';
    };
}
