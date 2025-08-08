{
  description = "A very basic configuration flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

    # Home manager import
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Nixvim import
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Hyprland import
    hyprland = {
      url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    };
  };

  outputs =
    {
      self,
      home-manager,
      nixvim,
      nixpkgs,
      hyprland,
      ...
    }@inputs:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      inherit (self) outputs;

      #===========================================
      #===========FLAKE-CLASS-CONFIG==============
      #===========================================

      configSettings = [
        # Import standard shared settings
        ./shared/std/all.nix
        ./shared/env/all.nix
        ./shared/dev/all.nix

        # Enable home manager use of global and usr pkgs
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.zacharyas = {
            home.stateVersion = "25.05";
          };
          home-manager.sharedModules = [
            # Import Nixvim module into home-manager
            nixvim.homeManagerModules.nixvim
            # Import all shared hm modules
            ./shared/hm/all.nix
          ];
          home-manager.extraSpecialArgs = { inherit inputs outputs; };
        }
      ];

      #===========================================
      #=========INDIVIDUAL-FLAKE-CONFIG===========
      #===========================================

    in
    {

      # Reusable nixos modules
      nixosModules = import ./modules/nixos;
      # Reusable home-manager modules
      homeManagerModules = (import ./modules/home-manager) {
        #inherit config;
        inherit lib;
        inherit pkgs;
        inherit outputs;
      };

      # Resuable configuration modules and resources
      configModules = import ./modules/config;
      nixosConfigurations = {
        Zach-Laptop = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs outputs; };
          modules = configSettings ++ [
            # import modules unique to this host
            ./hosts/Zach-Laptop/all.nix

            (
              { pkgs, ... }:
              {

                home-manager.users.zacharyas.imports = [
                  # Import host-specific hm module
                  ./hosts/Zach-Laptop/hm.nix
                ];
              }
            )
          ];
        };

        Zach-Desktop = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs outputs; };
          modules = configSettings ++ [
            # Import modules unique to this host
            ./hosts/Zach-Desktop/all.nix

            (
              { pkgs, ... }:
              {
                home-manager.users.zacharyas.imports = [
                  # Import host-specific hm module
                  ./hosts/Zach-Desktop/hm.nix
                ];
              }
            )
          ];
        };
      };

    };
}
