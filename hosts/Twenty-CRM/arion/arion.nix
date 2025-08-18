{
  inputs,
  outputs,
  arion,
  pkgs,
  ...
}:

{
  environment.systemPackages = [
    pkgs.arion
  ];
  #imports = [
  #  arion.nixModules.arion
  #];

  #virtualisation.arion = {
  #  backend = "podman-socket";
  #  projects.twenty = {
  #    serviceName = "twenty";
  #    settings = {
  #      imports = [ ./arion-compose.nix ];
  #    };
  #  };
  #};
}
