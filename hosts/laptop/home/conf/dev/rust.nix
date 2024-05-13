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

        sessionVariables = {
            CARGO_HOME = "${config.xdg.dataHome}/cargo";
        };
    };

    programs.zsh.sessionVariables = {
        RUST_SRC_PATH = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";
        RUST_BACKTRACE = 1;
        PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
    };
}
