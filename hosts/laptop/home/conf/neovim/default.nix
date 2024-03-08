{ config, pkgs, ... }:

{
	programs.neovim = {
		enable = true;

		viAlias = true;
		vimAlias = true;
		vimdiffAlias = true;

		extraLuaConfig = ''
			${builtins.readFile ./config}
		'';
		
		# extraLuaConfig = ''
		# 	${builtins.readFile ./config/options.lua}
		# 	${builtins.readFile ./config/keymaps.lua}
		# '';

		# plugins = with pkgs.vimPlugins; [
		# 	# theme
		# 	{
		# 		plugin = gruvbox-nvim;
		# 		config = "colorscheme gruvbox";
		# 	}
		#
		# 	# line
		# 	lualine-nvim
		# 	
		# 	# file manager
		# 	oil-nvim
		#
		# 	# telescope
		# 	plenary-nvim
		# 	{
		# 		plugin = telescope-nvim;
		# 		type = "lua";
		# 		config = ./config/plugins/telescope.lua;
		# 	}
		# ]
	};
}
