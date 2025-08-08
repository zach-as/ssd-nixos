{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;

    # Display manager
    displayManager = {
      gdm = {
        enable = true;
        wayland = true;
      };
    };
  };

  programs = {
    # Window manager
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    # file manager
    nautilus
    # console
    kitty
    # app launcher
    walker
    # keyring
    seahorse
    # theming
    nwg-look
    # screenshot
    hyprshot
    # clipboard
    wl-clip-persist

    # utils
    brightnessctl
    playerctl
    networkmanagerapplet
    pavucontrol

    # others
    gnome-calculator
    gnome-text-editor
  ];

  # Enable trash
  services.gvfs.enable = true;
  # Power-profiles-daemon
  services.power-profiles-daemon.enable = true;
}
