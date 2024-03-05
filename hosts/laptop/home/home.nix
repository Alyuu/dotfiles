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
		neovim
		floorp
		wofi
		git
		ranger
		discord
		nerdfonts
		pamixer
		gcc
		obsidian
	];

	programs.git = {
		userName = "Alyu NixOs";
		userEmail = "alejandro.yusesc@gmail.com";
	};

	home.file = {
	};

	home.sessionVariables = {
		# EDITOR = "emacs";
	};

	programs.home-manager.enable = true;

	home.activation = {
		installConfig = ''
			if [ ! -d "${config.home.homeDirectory}/.config/nvim" ]; then
			  ${pkgs.git}/bin/git clone --depth 1 https://github.com/Alyuu/nvim ${config.home.homeDirectory}/.config/nvim
			fi
		'';
	};

	home.stateVersion = "23.11";
}
