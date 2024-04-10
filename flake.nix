{
  description = "Alyu's dotfiles (work in progress)";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    hyprland.url = "github:hyprwm/Hyprland";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ags.url = "github:Aylur/ags";

    alyuu-nixvim.url = "github:Alyuu/nixvim";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      inherit (self) outputs;
      system = "x86_64-linux";
      pkgs = import nixpkgs {
      	inherit system;
	config.allowUnfree = true;
      };
    in
    {
    
	nixosConfigurations = {
		laptop = nixpkgs.lib.nixosSystem {
			specialArgs = { inherit inputs outputs; };
			modules = [
				./hosts/laptop/nixos/configuration.nix
				home-manager.nixosModules.home-manager
				{
					home-manager.useGlobalPkgs = true;
					home-manager.useUserPackages = true;
					home-manager.users.alyu = import ./hosts/laptop/home/home.nix ;
					home-manager.extraSpecialArgs = { inherit inputs outputs system; };
				}
			];
		};
	};

    };
}
