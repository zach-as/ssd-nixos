{
  #config,
  lib,
  pkgs,
  outputs,
  ...
}:

let
  inherit (lib) getExe;
in
{

  /*
    monitor = [
         "eDP-2, 2560x1600, 0x0, 1"
       ];
  */
  # Note that the line "/run/user/1000/..." refers to the uid of user zacharyas
  # which is manually set. This is a terrible way of doing things (hardcoding) and is liable to break
  # Refer to my-nixos to see the original implementation
  exec-once =
    let
      start-waybar = pkgs.writeShellScriptBin "start-waybar" ''
        while [ ! -S "/run/user/1000/hypr/''${HYPRLAND_INSTANCE_SIGNATURE}/.socket.sock" ]; do
          sleep 0.1
        done
        sleep 0.5
        ${getExe pkgs.waybar}
      '';
    in
    [
      #"${getExe pkgs.swaybg} -i ${config.home.file.wallpaper.target}"
      "${getExe pkgs.swaybg} -i ${outputs.configModules.wallpaper-target}"
      "${start-waybar}/bin/start-waybar"
    ];

  general = {
    gaps_out = 10;
  };

  input = {
    kb_layout = "us,se";
    kb_options = "grp:caps_switch";
    repeat_rate = 35;
    repeat_delay = 175;
    follow_mouse = true;
    touchpad = {
      natural_scroll = true;
      tap-and-drag = true;
    };
  };

  misc = {
    disable_hyprland_logo = true;
    disable_splash_rendering = true;
    disable_autoreload = true;
  };

  animations = {
    enabled = true;
    animation = [
      "global, 1, 5, default"
      "workspaces, 1, 1, default"
    ];
  };

  dwindle = {
    pseudotile = true;
    preserve_split = true;
  };

  gestures = {
    workspace_swipe = true;
  };

  device = [
    {
      name = "epic-mouse-v1";
      sensitivity = -0.5;
    }
    {
      name = "wacom-intuos-pt-m-pen";
      transform = 0;
      output = "eDP-2";
    }
  ];
  windowrule = [
    "float, class:^(.*)$"
    "size 550 350, class:^(.*)$"
    "center, class:^(.*)$"
  ];
}
