{ config, pkgs, inputs, ... }:

{
	imports = [
		./conf
	];
	
	home = {
		username = "alyu";
		homeDirectory = "/home/alyu";
	};

	home.packages = with pkgs; [
		alacritty
		floorp
		wofi
		git
		ranger
		discord
		nerdfonts
		pamixer
		gcc
		obsidian
		nodejs_21
		wl-clipboard
        spotify
        zsh
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
