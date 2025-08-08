{ outputs, lib, ... }:
let
  inherit (outputs.homeManagerModules) waybar-settings;
  inherit (outputs.homeManagerModules) hyprland-settings;
  inherit (outputs.homeManagerModules) hyprland-keybinds;
  inherit (outputs.homeManagerModules) hyprlock-settings;
  hyprland-settings-custom = {
    settings.monitor = [
      "eDP-2, 2560x1600, 0x0, 1"
    ];
  };
  waybar-settings-custom = {
    settings.mainBar = {
      output = [
        "eDP-2"
      ];
    };
  };
in
{
  # Set the hyprland settings using the base and the custom setting above
  wayland.windowManager.hyprland = {
    enable = true;
    settings = (
      lib.recursiveUpdate hyprland-settings (
        lib.recursiveUpdate hyprland-keybinds hyprland-settings-custom
      )
    );
  };
  programs.hyprlock.settings = {
    enable = true;
    settings = hyprlock-settings;
  };
  programs.waybar = {
    settings = (lib.recursiveUpdate waybar-settings waybar-settings-custom);
  };
}
