{ config, pkgs, inputs, system, ... }:

{
	imports = [
		./conf
	];
	
	home = {
		username = "alyu";
		homeDirectory = "/home/alyu";
	};

    home.packages = [ inputs.nixvim-flake.packages.${system}.default ];

	home.packages = with pkgs; [
        # Terminal
		alacritty
        zsh

        # App launcher
		wofi

        # Git
		git

        # File manager
		yazi

        # Browser
		floorp
        vieb

        # Fonts
		nerdfonts

        # Apps
		discord
        spotify
		obsidian

        # System
		pamixer
		gcc
		nodejs_21
		wl-clipboard
        brightnessctl
	];

	programs.git = {
		userName = "Alyu NixOs";
		userEmail = "alejandro.yusesc@gmail.com";
	};

	home.file = {
	};

	# activation = {
	# 	installConfig = ''
	# 		if [ ! -d "${config.home.homeDirectory}/.config/nvim" ]; then
	# 			${pkgs.git}/bin/git clone --depth 1 https://github.com/Alyuu/nvim ${config.home.homeDirectory}/.config/nvim
	# 		fi
	# 	'';
	# };

	home.sessionVariables = {
		# EDITOR = "emacs";
	};

	programs.home-manager.enable = true;

	home.stateVersion = "23.11";
}
