{ inputs, ... }:
{
    inputs.nixpkgs.overlays = [
        (final: prev: {
            delta = prev.delta.overrideAttrs (old: {
                version = "0.17.0-unstable-2024-08-12";
                src = prev.fetchFromGitHub {
                    owner = "dandavison";
                    repo = "delta";
                    rev = "a01141b72001f4c630d77cf5274267d7638851e4";
                    hash = "sha256-My51pQw5a2Y2VTu39MmnjGfmCavg8pFqOmOntUildS0=";
                };
                cargoHash = "sha256-Rlc3Bc6Jh89KLLEWBWQB5GjoeIuHnwIVZN/MVFMjY24=";
            });
        }
        )
    ];
}
