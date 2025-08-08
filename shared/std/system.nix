{ config, pkgs, ... }:

{
  # Enable auto upgrade
  system.autoUpgrade = {
    enable = true;
  };

  # This value determines the NixOS release fromo which the defaultt settings for stateful data, DO NOT TOUCH
  system.stateVersion = "25.05";

  # Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecoment=945091229
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  # Copy the NixOS configuration file and link it from the resulting system.
  # This is useful in case you accidentally delete configuration.nix.
  #system.copySystemConfiguration = true;
}
