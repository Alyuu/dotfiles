{ inputs, ... }:
{
    # modifications = final: prev: {
    #     delta = prev.delta.overrideAttrs (old: rec {
    #         pname = "delta";
    #         version = "0.17.0-unstable-2024-08-12";
    #         src = prev.fetchFromGitHub {
    #             owner = "dandavison";
    #             repo = pname;
    #             rev = "a01141b72001f4c630d77cf5274267d7638851e4";
    #             hash = "sha256-My51pQw5a2Y2VTu39MmnjGfmCavg8pFqOmOntUildS0=";
    #         };
    #         cargoDeps = old.cargoDeps.overrideAttrs (prev.lib.const {
    #           name = "${pname}-vendor.tar.gz";
    #           inherit src;
    #           outputHash = "sha256-R/FkMK38G7TOJp7U8Ps5kvEIIIXfJ8kE6nfMHHfjGD8=";
    #         });
    #     });
    # };
}
