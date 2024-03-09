{ pkgs, config, lib, ... }:

{
    # Set zsh config
    home.file."zsh-config" = {
        source = ./config;
        target = ".config/zsh";
    };

    # Set zsh config location
    home.file.".zshenv" = {
        text = "ZDOTDIR=$HOME/.config/zsh";
    };

    # Load plugins
    home.file = {
        ".config/zsh/plugins/zsh-autosuggestions".source = "${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions";
        ".config/zsh/plugins/zsh-fast-syntax-highlighting".source = "${pkgs.zsh-fast-syntax-highlighting}/share/zsh/site-functions";
        #".local/share/zsh/nix-zsh-completions".source = "${pkgs.nix-zsh-completions}/share/zsh/plugins/nix";
        #".local/share/zsh/zsh-vi-mode".source = "${pkgs.zsh-vi-mode}/share/zsh-vi-mode";
    };
}
