{
  config,
  outputs,
  lib,
  pkgs,
  ...
}:

let
  inherit (lib) substring;
  inherit (outputs.nixosModules.theme) colors fonts;
  unhashedHexes = lib.mapAttrs (n: c: substring 1 6 c) colors;
in

{
  home.packages = with pkgs; [
    # Music player
    cmus
    # Image viewer
    feh
    # Screen recorder
    kooha
    # Media player
    mpv
    # Secure messenger
    signal-desktop-bin
    # E-mail client
    thunderbird
    # Copy-paste utilities
    wl-clipboard
  ];

  home.file.wallpaper = {
    target = outputs.configModules.wallpaper-target;
    source = outputs.configModules.wallpaper-source;
  };
  /*
    home.file = lib.mkMerge [
      {
        ".config/hypr/wallpaper.jpg" = {
          source = ../../.config/wallpaper.jpg;
        };
      }
    ];
  */

  programs.foot = {
    enable = true;
    settings = {
      main.font = "${fonts.monospace}:size=11";
      main.dpi-aware = "no";
      mouse.hide-when-typing = "yes";
      colors = with unhashedHexes; {
        alpha = 0.8;
        background = base00;
        foreground = base07;

        regular0 = base00;
        regular1 = base01;
        regular2 = base02;
        regular3 = base03;
        regular4 = base04;
        regular5 = base05;
        regular6 = base06;
        regular7 = base07;

        bright0 = base08;
        bright1 = base09;
        bright2 = base0A;
        bright3 = base0B;
        bright4 = base0C;
        bright5 = base0D;
        bright6 = base0E;
        bright7 = base0F;
      };
    };
  };
}
