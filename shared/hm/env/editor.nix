{
  pkgs,
  ...
}:

{
    home.packages = with pkgs; [
      # Vector-based image editor
      inkscape
      # Raster-based image editor
      krita
      # Collaborative web app for interface design
      figma-linux
      # Video editor
      shotcut
      # Bitmap image editor
      pinta
      # Document editor
      mupdf
      # Note editor
      xournalpp
    ];
}
