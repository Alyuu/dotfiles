{ config, pkgs, ... }:

{
	programs.nvim = {
		enable = true;

		viAlias = true;
		vimAlias = true;
		vimdiffAlias = true;
		
		extraLuaConfig = ''
			${builtins.readFile ./config/options.lua}
			${builtins.readFile ./config/keymaps.lua}
		'';

		plugins = with pkgs.vimPlugins; [
			# theme
			gruvbox

			# line
			lualine-nvim
			
			# file manager
			oil-nvim

			# telescope
			{
				plugin = telescope-nvim;
				type = "lua";
				config = ./config/plugins/telescope.lua;
			}
		]
	}
}
