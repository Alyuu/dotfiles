{ pkgs, config, ...}:

{
    home = {
        packages = with pkgs; [
            cargo
            cargo-watch
            rustc
            rustfmt
            sqlx-cli
        ];

        sessionVariables.CARGO_HOME = "${config.xdg.dataHome}/cargo";
    };
}
