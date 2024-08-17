{ inputs, ... }:
{
    modifications = final: prev: {
        delta = prev.delta.overrideAttrs (old: {
            version = "0.18.0";
            src = prev.fetchFromGitHub {
                owner = "dandavison";
                repo = "delta";
                rev = "refs/tags/0.18.0";
                hash = "sha256-1UOVRAceZ4QlwrHWqN7YI2bMyuhwLnxJWpfyaHNNLYg=";
            };
            cargoHash = "sha256-/h7djtaTm799gjNrC6vKulwwuvrTHjlsEXbK2lDH+rc=";
        });
    };
}
