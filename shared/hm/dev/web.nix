{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Tool for sending HTTP requests  
    xh
  ];
}
