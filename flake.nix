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
        config.packageOverrides = pkgs: rec {
            electron_28 = pkgs.electron_28.overrideAttrs
                (oldAttrs: rec {

                 buildCommand =
                 let
                 electron-unwrapped = pkgs.electron_28.passthru.unwrapped.overrideAttrs (oldAttrs: rec {
                         postPatch = builtins.replaceStrings [ "--exclude='src/third_party/blink/web_tests/*'" ] [ "--exclude='src/third_party/blink/web_tests/*' --exclude='src/content/test/data/*'" ] oldAttrs.postPatch;
                         });
                 in
                 ''
                 gappsWrapperArgsHook
                 mkdir -p $out/bin
                 makeWrapper "${electron-unwrapped}/libexec/electron/electron" "$out/bin/electron" \
                 "''${gappsWrapperArgs[@]}" \
                 --set CHROME_DEVEL_SANDBOX $out/libexec/electron/chrome-sandbox

                 ln -s ${electron-unwrapped}/libexec $out/libexec
                 '';
                 });
            electron = pkgs.electron.overrideAttrs
                (oldAttrs: rec {
                 buildCommand =
                 let
                 electron-unwrapped = pkgs.electron.passthru.unwrapped.overrideAttrs (oldAttrs: rec {
                         postPatch = builtins.replaceStrings [ "--exclude='src/third_party/blink/web_tests/*'" ] [ "--exclude='src/third_party/blink/web_tests/*' --exclude='src/content/test/data/*'" ] oldAttrs.postPatch;
                         });
                 in
                 ''
                 gappsWrapperArgsHook
                 mkdir -p $out/bin
                 makeWrapper "${electron-unwrapped}/libexec/electron/electron" "$out/bin/electron" \
                 "''${gappsWrapperArgs[@]}" \
                 --set CHROME_DEVEL_SANDBOX $out/libexec/electron/chrome-sandbox

                 ln -s ${electron-unwrapped}/libexec $out/libexec
                 '';
                 });
        };
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
