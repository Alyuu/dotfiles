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

	home.stateVersion = "23.11";
}
