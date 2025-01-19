{ outputs, lib, ...}:

{
  programs.ssh = {
    enable = true;

    matchBlocks = {
        "git" = {
            host = "github.com gitlab.com";
            user = "git";
            forwardAgent = true;
            identitiesOnly = true;
            identityFile = [
                "~/.ssh/github-alyu"
            ];
        };
        "digital_ocean" = {
            host = "46.101.175.111";
            user = "root";
            forwardAgent = true;
            identitiesOnly = true;
            identityFile = [
                "~/.ssh/digital_ocean"
            ];
        };
        "tfs" = {
            host = "tfs.comminus.hr";
            user = "git";
            forwardAgent = true;
            identitiesOnly = true;
            identityFile = [
                "~/.ssh/git-comminus"
            ];
        };
        "azure" = {
            host = "ssh.dev.azure.com";
            user = "git";
            forwardAgent = true;
            identitiesOnly = true;
            identityFile = [
                "~/.ssh/git-comminus"
            ];
        };
    };
  };
}
