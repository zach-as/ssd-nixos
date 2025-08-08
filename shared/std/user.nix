{
  config,
  lib,
  pkgs,
  ...
}:

{
  # Define the user account
  users.users.zacharyas = {
    isNormalUser = true;
    description = "Zachary Ander-Sturtz";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [
      thunderbird
      tree
    ];
    uid = 1000;
  };

  # Enable automatic login for the user
  #services.displayManager.autoLogin.enable = true;
  #services.displayManager.autoLogin.user = "zacharyas";
}
