{ pkgs, config, ...}:

{
    home = {
        packages = with pkgs; [
            cargo
            rustc
            rustfmt
            sqlx-cli
        ];

        sessionVariables.CARGO_HOME = "${config.xdg.dataHome}/cargo";
    };
}
