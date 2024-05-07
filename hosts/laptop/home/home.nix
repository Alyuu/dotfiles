{ config, pkgs, inputs, system, ... }:

{
	imports = [
		./conf
	];
	
	home = {
		username = "alyu";
		homeDirectory = "/home/alyu";
	};

	home.packages = with pkgs; [
        # Terminal
        foot
        zsh

        # Containers
        docker

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
        vesktop
        spotify

        # System
		pamixer
		gcc
		nodejs
		wl-clipboard
        brightnessctl
        sshpass
        dunst

        inputs.alyuu-nixvim.packages.${system}.default
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
        SHELL = "zsh";
        TERM = "foot";
	};

	programs.home-manager.enable = true;

	home.stateVersion = "23.11";
}
