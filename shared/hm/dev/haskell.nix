{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ghc
    cabal-install

    haskellPackages.zlib
    haskellPackages.zlib-clib
    haskellPackages.zlib-bytes
    haskellPackages.zlib-conduit
    haskellPackages.zlib-bindings

    zstd
    xz
    bzip2
    # zlib
  ];
}
