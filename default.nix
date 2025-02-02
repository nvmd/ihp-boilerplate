let
    # ihp = builtins.fetchGit {
    #     url = "https://github.com/digitallyinduced/ihp.git";
    #     ref = "refs/tags/v0.17.0";
    # };
    ihp = builtins.fetchGit {
        url = "https://github.com/nvmd/ihp.git";
        ref = "refs/heads/v0.17.0-m1";
    };
    # ihp = ../ihp;
    haskellEnv = import "${ihp}/NixSupport/default.nix" {
        ihp = ihp;
        haskellDeps = p: with p; [
            cabal-install
            base
            wai
            text
            hlint
            p.ihp
        ];
        otherDeps = p: with p; [
            # Native dependencies, e.g. imagemagick
        ];
        projectPath = ./.;
    };
in
    haskellEnv
