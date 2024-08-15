{ pkgs, ... }:
{
    programs.waybar = {
        enable = true;
        settings = {
            mainBar = {
                layer = "top";
                position = "top";
                modules-left = [ "custom/startmenu" "hyprland/workspaces" ];
                modules-center = [ "clock" ];
                modules-right = [ "tray" "network" "pulseaudio" ];

                "custom/startmenu" = {
                    format = " ";
                    tooltip = false;
                };
                
                "hyprland/workspaces" = {
                    format = "{icon}";
                    format-icons = {
					"1" = "一";
					"2" = "二";
					"3" = "三";
					"4" = "四";
					"5" = "五";
                    };
                    persistent-workspaces = {
                        "*" = 5;
                    };
                };

                clock = {
                    format = "{:%R - %d/%m/%Y}";
                    tooltip = true;
                    tooltip-format = "<tt><small>{calendar}</small></tt>";
                };

                tray = {
                    spacing = 16;
                };

                network = {
                    format-icons = [
                        "󰤯"
                        "󰤟"
                        "󰤢"
                        "󰤥"
                        "󰤨"
                    ];
                    format-ethernet = " {bandwidthDownOctets}";
                    format-wifi = "{icon}  {essid}";
                    format-disconnected = "󰤮";
                    tooltip = false;
                };

                pulseaudio = {
                    format = "{icon}";
                    "tooltip-format" = "Volume : {volume}%";
                    "format-muted" = "󰖁";
                    "format-icons" = {
                        "default" = [ "" "" "" ];
                    };
                    "on-click" = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
                };
            };
        };
        style = ''
			* {
				font-family: "FantasqueSansMNerdFont";
				font-size: 12pt;
				font-weight: bold;
				transition-property: background-color;
				transition-duration: 0.5s;
			}
			@keyframes bink_red {
				to {
					background-color: rgb(242, 143, 173);
					color: rgb(26, 24, 38);
				}
			}
			.warning, .critical, .urgent {
				animation-name: blink_red;
				animation-duration: 1s;
				animation-timing-function: linear;
				animation-iteration-count: infinite;
				animation-direction: alternate;
			}
			window#waybar {
				background-color: transparent;
			}
			window > box {
				margin-left: 10px;
				margin-right: 10px;
				margin-top: 10px;
				background-color: #282828;
				padding: 5px 20px;
			}
			#workspaces {
				padding-left: 0px;
				padding-right: 4px;
			}
			#workspaces button {
				padding-top: 5px;
				padding-bottom: 5px;
				padding-left: 6px;
				padding-right: 6px;
				color: #689D6A;
			}
			#workspaces button.empty {
				color: #928374;
			}
			#workspaces button.active {
				color: #8EC07C;
			}
			#workspaces button.urgent {
				color: #FB4934;
			}
            #workspaces:hover {
                background-color: transparent;
            }
			tooltip {
                background: #282828;
			}
			tooltip label {
                color: #EBDBB2;
			}
			#mode, #clock, #pulseaudio, #network, #custom-startmenu {
				padding-left: 10px;
				padding-right: 10px;
			}
			#clock {
                color: #8EC07C;
			}
			#pulseaudio {
                color: #8EC07C;
			}
			#network {
                color: #8EC07C;
			}
			#network.disconnected {
                color: rgb(255, 255, 255);
			}
			#tray {
				padding-right: 8px;
				padding-left: 10px;
			}
            #custom-startmenu {
                color: #8EC07C;
                font-size: 16px;
            }
		'';
    };
}
