{ pkgs, config, ... }:

{
  environment.systemPackages = with pkgs; [
    # Terminal emulator (required for hyprland)
    kitty 
    # Text editor
    neovim
    # Unzip utility
    unzip
    # File download utility
    wget
  ];
}
