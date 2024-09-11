{ pkgs, ... }:
let
    tmux-gruvbox = pkgs.tmuxPlugins.mkTmuxPlugin
        {
            pluginName = "tmux-gruvbox";
            version = "unstable-2024-09-11";
            src = pkgs.fetchFromGitHub {
                owner = "Alyuu";
                repo = "tmux-gruvbox";
                rev = "61ec5d5f634d09dbf1570bb436d1e7a723105470";
                sha256 = "sha256-8fplIHQTkqc2jdPvZo56hgfrCc7jwMdz2Z24gOKyyj8=";
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
        '';
    };
}
