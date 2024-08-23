{
  description = "Alyu's dotfiles";

  inputs = {
    # Official packages
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Hyprland
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

    # Neovim
    alyuu-nixvim = {
        url = "github:Alyuu/nixvim";
        inputs.nixpkgs.follows = "nixpkgs";
    };

    # Spicetify
    spicetify.url = "github:Gerg-L/spicetify-nix";

    # Quickshell
    quickshell = {
      url = "git+https://github.com/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs/* , nixpkgs-stable */, home-manager, ... } @ inputs: 
  let
    inherit (self) outputs;
    forAllSystems = nixpkgs.lib.genAttrs [
      "x86_64-linux"
    ];
    inherit (nixpkgs) lib;
    configLib = import ./lib { inherit lib; };
    # pkgs-stable = nixpkgs-stable.legacyPackages.x86_64-linux;
    specialArgs = { inherit inputs outputs configLib nixpkgs /* pkgs-stable */; };
  in
  {
    nixos-modules = import ./modules/nixos;
    home-manager-modules = import ./modules/home-manager;

    overlays = import ./overlays { inherit inputs outputs; };

    nixosConfigurations = {
      pc = lib.nixosSystem {
        inherit specialArgs;
        modules = [
          home-manager.nixosModules.home-manager{
            home-manager.extraSpecialArgs = specialArgs;
          }
          ./hosts/pc
        ];
      };
      laptop = lib.nixosSystem {
        inherit specialArgs;
        modules = [
          home-manager.nixosModules.home-manager{
            home-manager.extraSpecialArgs = specialArgs;
          }
          ./hosts/laptop
        ];
      };
    };
  };
}
