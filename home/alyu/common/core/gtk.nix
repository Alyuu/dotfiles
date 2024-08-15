{ config, lib, pkgs, ... }:

{
	gtk = {
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
        gtk3.extraConfig = {
          Settings = ''
            gtk-application-prefer-dark-theme=1
          '';
        };
        gtk4.extraConfig = {
          Settings = ''
            gtk-application-prefer-dark-theme=1
          '';
        };
	};
}
