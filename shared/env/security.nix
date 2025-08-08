{ config, pkgs, ... }:

{
  # polkit
  security.polkit.enable = true;
  # keyring
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.gdm-password.enableGnomeKeyring = true;
}
