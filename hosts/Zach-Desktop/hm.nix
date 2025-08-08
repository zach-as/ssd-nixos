{ outputs, lib, ... }:
let
  inherit (outputs.homeManagerModules) hyprland-settings;
  inherit (outputs.homeManagerModules) hyprland-keybinds;
  inherit (outputs.homeManagerModules) hyprlock-settings;
  inherit (outputs.homeManagerModules) waybar-settings;
  hyprland-settings-custom = {
    settings.monitor = [
      "HDMI-A-1, 1920x1080, 2560x0, 1"
      "DP-2, 1920x1080, 0x-1440, 1, mirror, DP-3"
      "DP-3, 2560x1440, 0x0, 1"
    ];
  };
  waybar-settings-custom = {
    settings.mainBar = {
      output = [
        "HDMI-A-1"
        "DP-2"
        "DP-3"
      ];
    };
  };
in
{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = (
      lib.recursiveUpdate hyprland-settings (
        (lib.recursiveUpdate hyprland-keybinds hyprland-settings-custom)
      )
    );
  };
  programs.hyprlock = {
    enable = true;
    settings = hyprlock-settings;
  };
  programs.waybar = {
    settings = (lib.recursiveUpdate waybar-settings waybar-settings-custom);
  };
}
