{ config, pkgs, ... }:

{
	programs.neovim = 
	let
		toLua = str: "lua << EOF\n${str}\nEOF\n";
		toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
	in
	{
		enable = true;

		viAlias = true;
		vimAlias = true;
		vimdiffAlias = true;

		#extraLuaConfig = ''
		#	${builtins.readFile ./config/init.lua}
		#'';
		
		extraLuaConfig = ''
			${builtins.readFile ./config/options.lua}
			${builtins.readFile ./config/keymaps.lua}
		'';

		plugins = with pkgs.vimPlugins; [
			# theme
			{
				plugin = gruvbox-nvim;
				config = "colorscheme gruvbox";
			}
		
			# line
			lualine-nvim
			
			# file manager
			oil-nvim
		
			# telescope
			plenary-nvim
			{
				plugin = telescope-nvim;
				type = "lua";
				config = toLuaFile ./config/plugins/telescope.lua;
			}
			telescope-fzf-native-nvim
			
			# treesitter
			{
				plugin = (nvim-treesitter.withPlugins (p: [
					p.tree-sitter-nix
					p.tree-sitter-vim
					p.tree-sitter-bash
					p.tree-sitter-lua
					p.tree-sitter-python
					p.tree-sitter-json
				]));
				type = "lua";
				config = toLuaFile ./config/plugins/treesitter.lua;
			}
		];
	};
}
