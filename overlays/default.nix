{ inputs, ... }:
{
    modifications = final: prev: {
        delta = prev.delta.overrideAttrs (old: rec {
            pname = "delta";
            version = "0.18.0";
            src = prev.fetchFromGitHub {
                owner = "dandavison";
                repo = "delta";
                rev = "refs/tags/0.18.0";
                hash = "sha256-1UOVRAceZ4QlwrHWqN7YI2bMyuhwLnxJWpfyaHNNLYg=";
            };
            cargoDeps = old.cargoDeps.overrideAttrs (prev.lib.const {
              name = "${pname}-vendor.tar.gz";
              inherit src;
              outputHash = "sha256-/h7djtaTm799gjNrC6vKulwwuvrTHjlsEXbK2lDH+rc=";
            });
        });
    };
}
