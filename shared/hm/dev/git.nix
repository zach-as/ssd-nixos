{ pkgs, ... }:

/*
  let
    nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/main.tar.gz") repos;
  in
*/
/*
  let
    nur = import (
      builtins.fetchGit {
        url = "https://github.com/nix-community/NUR";
      }
    );
  in
*/
{
  # Make NUR Accessible
  /*
    nixpkgs.config.packageOverrides = pkgs: {
      nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/main.tar.gz") {
        inherit pkgs;
      };
    };
  */

  home.packages = with pkgs; [
    git
    git-credential-manager
  ];

  programs.git = {
    # Enable git
    enable = true;
    extraConfig = {
      # Set up credential manager
      credential = {
        helper = "manager";
        "https://github.com".username = "zach-as";
        credentialStore = "cache";
      };

      # Set default branch to main
      init.defaultBranch = "main";
    };
  };

  # Configure Git
  /*
    programs.git = {
      enable = true;
      #userName = "zach-as";
      #userEmail = "zach.andersturtz@sturtzsolutions.com";

      extraConfig = with pkgs; {
        # Specify login info
        user.name = "zach-as";
        user.email = "zach.andersturtz@sturtzsolutions.com";
        # Use git-credential-helper
        #credential.helper = "${pkgs.git.override { withLibsecret = true; }}/bin/git-credential-libsecret";

        # Set default branch to main
        init.defaultBranch = "main";

        # Use git-credential-manager

        credential = {
          credentialStore = "secretservice";
          helper = "${nur.repos.utybo.git-credential-manager}/bin/git-credential-manager-core";
        };

        # "Auto remote push
        push = {
          autoSetUpRemote = true;
        };
      };
    };
  */
}
