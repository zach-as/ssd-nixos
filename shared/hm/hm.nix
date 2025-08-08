{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:

let
  #  home-manager = builtins.fetchTarball https://github.com/nix-community/home-manager/archive/release-25.05.tar.gz;
  #inherit (inputs) home-manager;
in
{
  # imports =
  #[ # Import home manager
  #  (import "${home-manager}/nixos")
  #];

  /*
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      sharedModules = [ ./hm-modules/all.nix ];
      users.zacharyas = {
        home.stateVersion = "25.05";
      };
    };
  */

  /*
    home-manager.sharedModules =
    [({ config, lib, ... }:
      # Load global home manager configs
      (import ./global.nix)
    )];
  */
}
