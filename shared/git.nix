{
  config,
  lib,
  pkgs,
  ...
}:

{
  programs.git = {
    enable = true;
    config.user = {
      name = "zach-as";
      email = "zach.andersturtz@sturtzsolutions.com";
    };
  };
}
