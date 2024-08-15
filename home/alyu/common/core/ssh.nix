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
