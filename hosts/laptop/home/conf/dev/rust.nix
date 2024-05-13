{ pkgs, config, ...}:

{
    home = {
        packages = with pkgs; [
            cargo
            cargo-watch
            rustc
            rustfmt
            sqlx-cli
            pkg-config
            openssl
        ];

        sessionVariables.CARGO_HOME = "${config.xdg.dataHome}/cargo";
    };
}
