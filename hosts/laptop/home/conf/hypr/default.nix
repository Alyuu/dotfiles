{ config, lib, pkgs, inputs, ... }:

{
	#imports = {
	#	
	#};

	home.packages = with pkgs; [
		waybar
		swww
	];

	wayland.windowManager.hyprland = {
		package = inputs.hyprland.packages."${pkgs.system}".hyprland;
		enable = true;

		settings = {
			monitor = ",preferred,auto,1";

			exec-once = [
				"swww init & sleep 0.5 & swww img ~/Pictures/wallpapers/vagabond_centered.jpeg"
				"hyprctl setcursor Bibata-Modern-Classic 24"
				"waybar"
			];

			"$terminal" = "foot";
			"$fileManager" = "yazi";
			"$menu" = "wofi --show drun";

			env = [
				"XCURSOR_SIZE,24"
				"QT_QPA_PLATFORMTHEME,qt5ct"
			];

			input = {
				kb_layout = "us";
				kb_variant = "altgr-intl";
				kb_model = "";
				kb_options = "";
				kb_rules = "";

				follow_mouse = 1;

				touchpad = {
					natural_scroll = false;
				};

				sensitivity = 0;
			};

			general = {
				gaps_in = 5;
				gaps_out = 20;
				border_size = 4;
				"col.active_border" = "rgba(8ec07cff)";
				"col.inactive_border" = "rgba(689d6aff)";

				layout = "master";
			};

			decoration = {
				rounding = 0;

				blur = {
					enabled = true;
					size = 3;
					passes = 1;

					vibrancy = 0.1696;
				};

				drop_shadow = true;
				shadow_range = 4;
				shadow_render_power = 3;
				"col.shadow" = "rgba(1a1a1aee)";
			};

			animations = {
				enabled = true;

				bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

				animation = [
					"windows, 1, 7, myBezier"
					"windowsOut, 1, 7, default, popin 80%"
					"border, 1, 10, default"
					"borderangle, 1, 8, default"
					"fade, 1, 7, default"
					"workspaces, 1, 6, default"
				];
			};

			dwindle = {
				pseudotile = true;
				preserve_split = true;
			};

			master = {
				# See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
				new_is_master = true;
			};

			gestures = {
				# See https://wiki.hyprland.org/Configuring/Variables/ for more
				workspace_swipe = false;
			};

			"$mainMod" = "SUPER";

			bind = [
				"$mainMod, RETURN exec, $terminal"
				"$mainMod, C, killactive,"
				"$mainMod, M, exit,"
				"$mainMod, E, exec, $fileManager"
				"$mainMod, V, togglefloating,"
				"$mainMod, R, exec, $menu"
				"$mainMod, P, pseudo,"
				"$mainMod, J, togglesplit,"
                "$mainMod SHIFT, S, exec, grim -g '$(slurp -d)' - | wl-copy"
				# Move focus with mainMod + arrow keys
				"$mainMod, left, movefocus, l"
				"$mainMod, right, movefocus, r"
				"$mainMod, up, movefocus, u"
				"$mainMod, down, movefocus, d"
				# Switch workspaces with mainMod + [0-9]
				"$mainMod, 1, workspace, 1"
				"$mainMod, 2, workspace, 2"
				"$mainMod, 3, workspace, 3"
				"$mainMod, 4, workspace, 4"
				"$mainMod, 5, workspace, 5"
				"$mainMod, 6, workspace, 6"
				"$mainMod, 7, workspace, 7"
				"$mainMod, 8, workspace, 8"
				"$mainMod, 9, workspace, 9"
				"$mainMod, 0, workspace, 10"
				# Move active window to a workspace with mainMod + SHIFT + [0-9]
				"$mainMod SHIFT, 1, movetoworkspace, 1"
				"$mainMod SHIFT, 2, movetoworkspace, 2"
				"$mainMod SHIFT, 3, movetoworkspace, 3"
				"$mainMod SHIFT, 4, movetoworkspace, 4"
				"$mainMod SHIFT, 5, movetoworkspace, 5"
				"$mainMod SHIFT, 6, movetoworkspace, 6"
				"$mainMod SHIFT, 7, movetoworkspace, 7"
				"$mainMod SHIFT, 8, movetoworkspace, 8"
				"$mainMod SHIFT, 9, movetoworkspace, 9"
				"$mainMod SHIFT, 0, movetoworkspace, 10"
				# Example special workspace (scratchpad)
				"$mainMod, M, togglespecialworkspace, magic"
				"$mainMod SHIFT, M, movetoworkspace, special:magic"
				# Scroll through existing workspaces with mainMod + scroll
				"$mainMod, mouse_down, workspace, e+1"
				"$mainMod, mouse_up, workspace, e-1"
				# Multimedia
				",XF86AudioMicMute,exec,pamixer --default-source -t"
				",XF86MonBrightnessUp,exec,brightnessctl s +10%"
				",XF86MonBrightnessDown,exec,brightnessctl s 10%-"
				",XF86AudioMute,exec,pamixer -t"
				",XF86AudioLowerVolume,exec,pamixer -d 10"
				",XF86AudioRaiseVolume,exec,pamixer -i 10"
				",XF86AudioPlay,exec,playerctl play-pause"
				",XF86AudioPause,exec,playerctl play-pause"
			];

			bindm = [
				# Move/resize windows with mainMod + LMB/RMB and dragging
				"$mainMod, mouse:272, movewindow"
				"$mainMod, mouse:273, resizewindow"
			];
		};

	};
}
