{ inputs, pkgs, ... }:
let
spicePkgs = inputs.spicetify.legacyPackages.${pkgs.system};
in
{
    imports = [inputs.spicetify.homeManagerModules.default];
    programs.spicetify = {
        spotifyPackage = pkgs.spotify;
        enable = true;

        theme = spicePkgs.themes.text;
        colorScheme = "Gruvbox";

        enabledExtensions = with spicePkgs.extensions; [
            fullAppDisplay
            shuffle # shuffle+ (special characters are sanitized out of ext names)
            hidePodcasts
            playlistIcons
            lastfm
            # genre
            historyShortcut
            bookmark
            fullAlbumDate
            groupSession
            popupLyrics
        ];
    };
}
