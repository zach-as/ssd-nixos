{
  pkgs,
  lib,
  ...
}:
{
  "$mainMod" = "SUPER";

  bind =
    let
      e = lib.getExe;
      hyprctl = "${pkgs.hyprland}/bin/hyprctl";
      activeMonitor = "${hyprctl} monitors | ${e pkgs.gawk} '/Monitor/{mon=$2} /focused: yes/{print mon}'";
      workspaces = builtins.genList (x: x) 10;
    in
    with pkgs;
    [
      "$mainMod, i, exec, ${e foot}"
      "$mainMod, o, exec, ${e qutebrowser}"
      "$mainMod, r, exec, ${e fuzzel}"
      ''$mainMod, p, exec, ${e grim} -g "$(${e slurp})" - | ${e swappy} -f -''
      '', PRINT, exec, ${e grim} -o "$(${activeMonitor})" - | ${e swappy} -f -''
      "$mainMod, return, togglefloating,"
      "$mainMod, c, killactive,"
      "$mainMod, q, exit,"
      "$mainMod, d, pseudo,"
      "$mainMod, a, togglesplit,"
      "$mainMod, s, exec, systemctl suspend,"

      # Change focused window
      "$mainMod, h, movefocus, l"
      "$mainMod, l, movefocus, r"
      #"$mainMod, l, exec, hyprlock"
      "$mainMod, k, movefocus, u"
      #"$mainMod, j, cyclenext, hist"
      "$mainMod, j, movefocus, d"

      # Moving windows
      "$mainMod SHIFT, h, swapwindow, l"
      "$mainMod SHIFT, l, swapwindow, r"
      "$mainMod SHIFT, k, swapwindow, u"
      "$mainMod SHIFT, j, swapwindow, d"

      "$mainMod, mouse_down, workspace, e+1"
      "$mainMod, mouse_up, workspace, e-1"

    ]
    ++ map (i: "$mainMod, ${toString i}, workspace, ${toString i}") workspaces
    ++ map (i: "$mainMod SHIFT, ${toString i}, movetoworkspacesilent, ${toString i}") workspaces;

  binde = [
    # Move windows while holding down keys
    # Move window left
    "$mainMod SHIFT, h, moveactive, -50 0"
    # Move window right
    "$mainMod SHIFT, l, moveactive, 50 0"
    # Move window up
    "$mainMod SHIFT, k, moveactive, 0 -50"
    # Move window down
    "$mainMod SHIFT, j, moveactive, 0 50"
  ];
  bindm = [
    "$mainMod, mouse:272, movewindow"
    "$mainMod, mouse:273, resizewindow"
  ];
}
