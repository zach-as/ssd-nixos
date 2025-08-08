{
  lib,
  pkgs,
  outputs,
}:

{
  hyprland-settings = (import ./hyprland/hyprland.nix) {
    inherit outputs;
    inherit lib;
    inherit pkgs;
  };
  hyprland-keybinds = (import ./hyprland/hypr-keybinds.nix) {
    inherit pkgs;
    inherit lib;
  };
  # hyprlock settings
  hyprlock-settings = (import ./hyprland/hyprlock.nix) { inherit outputs; };
  # waybar settings
  waybar-settings = (import ./hyprland/waybar.nix) { inherit outputs; };
}
