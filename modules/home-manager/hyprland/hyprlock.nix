{
  outputs,
  ...
}:

let
  inherit (outputs.nixosModules.theme) colors fonts;
in
{
  general = {
    ignore_empty_input = true;
    hide_cursor = true;
  };

  background = [
    {
      color = "#000000";
    }
  ];

  input-field = [
    {
      position = "0, 0";
      font-family = fonts.monospace;
    }
  ];
}
