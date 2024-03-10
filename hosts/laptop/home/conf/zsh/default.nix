{ pkgs, config, lib, ... }:

{
    # Set zsh config
    # home.file."zsh-config" = {
    #     source = ./config;
    #     target = ".config/zsh";
    # };

    home.activation = {
        zshConfig = ''
            mkdir -p ${config.home.homeDirectory}/.config/zsh
            shopt -s dotglob
            cp -r --preserve=all ${toString ./config}/* ${config.home.homeDirectory}/.config/zsh
            chmod -R +w ${config.home.homeDirectory}/.config/zsh
        '';
    };

    # Set zsh config location
    home.file.".zshenv" = {
        text = "ZDOTDIR=$HOME/.config/zsh";
    };

    # Load plugins
    home.file = {
        ".local/share/zsh/zsh-powerlevel10k".source = "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k";
        ".local/share/zsh/zsh-autosuggestions".source = "${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions";
        ".local/share/zsh/zsh-fast-syntax-highlighting".source = "${pkgs.zsh-fast-syntax-highlighting}/share/zsh/site-functions";
        #".local/share/zsh/nix-zsh-completions".source = "${pkgs.nix-zsh-completions}/share/zsh/plugins/nix";
        #".local/share/zsh/zsh-vi-mode".source = "${pkgs.zsh-vi-mode}/share/zsh-vi-mode";
    };

    # Shell plugins
    home.packages = with pkgs; [
    ];
}
