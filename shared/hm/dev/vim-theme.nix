{
  outputs,
  config,
  lib,
  pkgs,
  ...
}:

let
  inherit (outputs.nixosModules.theme) colors fonts;
in
{
  programs.nixvim = {
    colorschemes.kanagawa = {
      enable = true;
      settings = {
        transparent = false;
        colors.palette = with colors; {
          katanaGray = black-100; # deprecated
          fujiGray = black-200; # syn.comment term:bright black
          sumiInk6 = black-300; # nontext whitespace
          sumiInk5 = black-400; # bg_p2
          sumiInk4 = black-500; # bg_gutter bg_p1
          sumiInk3 = black-600; # bg
          sumiInk2 = black-700; # bg_m1
          sumiInk1 = black-800; # bg_dim bg_m2
          sumiInk0 = black-900; # bg_m3 float.bf float.fg_border float.bg_border term:black

          peachRed = red-300; # syn.special3 term:ext2
          autumnRed = red-400; # vcs.removed term:red
          samuraiRed = red-500; # diag.error term:bright red

          sakuraPink = pink-300; # syn.number
          waveRed = pink-400; # syn.preproc syn.special2
          winterRed = pink-500; # diff.delete

          springGreen = green-300; # syn.string diag.ok term:bright green
          autumnGreen = green-400; # vcs.added term:green
          winterGreen = green-500; # diff.add

          carpYellow = yellow-300; # syn.identifier term:bright yellow
          autumnYellow = yellow-400; # vcs.changed
          roninYellow = yellow-500; # diag.warning

          winterYellow = beige-500; # diff.text
          boatYellow1 = beige-400;
          boatYellow2 = beige-300; # syn.operator syn.regex term:yellow

          surimiOrange = orange-400; # syn.constant term:ext1

          lightBlue = blue-200; # syn.preproc?
          springBlue = blue-300; # syn.special1 term:bright blue
          crystalBlue = blue-400; # syn.fun term:blue
          waveBlue2 = blue-500; # bg_search pmenu.bg_sel pmenu.bg_thumb
          waveBlue1 = blue-600; # fg_reverse bg_visual pmenu.bg pmenu.bg_sbar
          winterBlue = blue-700; # diff.change

          oniViolet2 = purple-200; # syn.parameter
          springViolet1 = purple-300; # special term: bright magenta
          springViolet2 = purple-400; # syn.punct
          oniViolet = purple-500; # syn.statement syn.keyword term:magenta

          waveAqua2 = cyan-300; # syn.type term:bright cyan
          waveAqua1 = cyan-400; # diag.hint term:cyan
          dragonBlue = cyan-500; # diag.info

          oldWhite = white-500; # fg_dim float.fg term:white
          fujiWhite = white-400; # fg pmenu.fg term:bright white
        };
      };
    };
  };
}
