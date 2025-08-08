{ pkgs, ... }:

{
  home.packages = with pkgs; [ 
    # Dotnet 8.x
    dotnetCorePackages.sdk_8_0_3xx-bin

    # NodeJS 20.x 
    nodejs_20

    # GNU Compiler
    gcc

    # Package management for NPM
    npm-check-updates
  ];
}
