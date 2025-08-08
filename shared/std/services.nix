{ config, lib, pkgs, ... }:

{
  services = {
    xserver = {
      # Enable the X11 windowing system
      enable = true;

      # Enable the GNOME Desktop Environment
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;

      # Configure keymap in X11
      xkb = {
        layout = "us";
	variant = "";
      };
    };
    # Enable CUPS to print documents
    printing.enable = true;

    # Enable sound with pipewire
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If we want to use JACK applications, uncomment this
      #jack.enable = true;
    };

    # Enable touchpad support
    libinput.enable = true;

    # Enable flatpak for package management
    flatpak.enable = true;

    # Enable OpenSSH
    openssh.enable = true;
  };

  # Used for scheduling priority for audio handling
  security.rtkit.enable = true;

}
