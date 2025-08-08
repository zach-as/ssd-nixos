{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Python linter and formatter
    ruff
    # Python
    python314
    # Python package installer and resolver
    uv
  ];

  programs.nixvim = {
    autoCmd = [
      {
        command = "silent :!${pkgs.isort}/bin/isort format %";
        event = [ "BufWritePost" ];
        pattern = [ "*.py" ];
      }
      {
        command = "silent :!${pkgs.ruff}/bin/ruff format %";
        event = [ "BufWritePost" ];
        pattern = [ "*.py" ];
      }
      {
        command = "silent :!${pkgs.nixfmt-rfc-style}/bin/nixfmt %";
        event = [ "BufWritePost" ];
        pattern = [ "*.nix" ];
      }
    ];
  };
}
