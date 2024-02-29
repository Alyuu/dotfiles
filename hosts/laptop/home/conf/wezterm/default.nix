{ config, lib, inputs, pkgs, ... }:

{
	programs.wezterm = {
		enable = true;
		package = inputs.nixpkgs-f2k.packages.${pkgs.system}.wezterm-git;
	};
}
