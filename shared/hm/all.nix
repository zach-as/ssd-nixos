{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./user.nix
    ./dev/all.nix
    ./env/all.nix
    #./hm.nix
  ];
}
