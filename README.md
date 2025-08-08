Make sure to type this command in the shell so that NixOS will know where to look for configuration.nix:

export NIX_PATH="nixos-config=/home/zacharyas/nixos/configuration.nix"

Then, rebuild with nixos-rebuild switch.

Alternatively, rebuild with nixos-rebuild switch -I nixos-config=/path/to/configuration.nix
