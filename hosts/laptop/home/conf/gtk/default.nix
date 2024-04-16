{ config, lib, pkgs, ... }:

{
	programs.gtk = {
		enable = true;
		#iconTheme = {
		#	name = "Yaru-magenta-dark";
		#	package = pkgs.yaru-theme;
		#};

		theme = {
			name = "gruvbox-dark-gtk";
			package = pkgs.gruvbox-dark-gtk;
		};

		cursorTheme = {
			name = "Bibata-Modern-Classic";
			package = pkgs.bibata-cursors;
		};
	};
}
