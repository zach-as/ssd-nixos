{ outputs, ... }:

{
  imports = [
    outputs.homeManagerModules.hyprland
  ];
  wayland.windowManager.hyprland = {
    settings = {
      monitor = [
        "eDP-2, 2560x1600, 0x0, 1"
      ];
    };
  };

}
