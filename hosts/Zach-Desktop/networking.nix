{
  config,
  lib,
  pkgs,
  ...
}:

{
  # Define the hostname
  networking.hostName = "Zach-Desktop";

  # Enable network manager
  networking.networkmanager.enable = true;

  # Enable wireless support via wpa_supplicant
  #networking.wireless.enable = true;

  # Configure network proxy if necessary
  #networking.proxy.default = "http://user:password@proxy:port/";
  #networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Open ports in the firewall
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether
  # networking.firewall.enable = false;
}
