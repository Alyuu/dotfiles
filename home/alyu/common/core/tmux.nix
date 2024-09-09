{ pkgs, ... }:
{
    programs.tmux = {
        enable = true;
        shell = "${pkgs.zsh}/bin/zsh";
        clock24 = true;
        historyLimit = 10000;
    };
}
