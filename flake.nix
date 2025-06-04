{
  description = "Nixie's server configurations";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    agenix.url = "github:ryantm/agenix";
    hardware.url = "github:NixOS/nixos-hardware";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs = {
    nixpkgs,
    unstable,
    ...
  } @ inputs: let
    supportedSystems = ["x86_64-linux"];

    forAllSupportedSystems = function:
      nixpkgs.lib.genAttrs supportedSystems (system:
        function (import nixpkgs {
          inherit system;
          config.allowUnfree = true;
          config.nvidia.acceptLicense = true;
        }));

    mylib = import ./lib/mylib.nix {inherit (nixpkgs) lib;};
    proxy-ports = import ./proxy-ports.nix {inherit mylib;};
  in {
    nixosConfigurations = let
      mkSystem = name:
        nixpkgs.lib.nixosSystem {
          modules = [
            inputs.agenix.nixosModules.default

            ./common
            ./tubes/${name}

            ({lib, ...}: {networking.hostName = lib.mkDefault name;})
          ];

          specialArgs = {
            inherit inputs;
            inherit mylib;
            inherit proxy-ports;
            inherit unstable;
            attrName = name;
          };
        };
    in {
      LinusWS = mkSystem "LinusWS";
    };

    packages = forAllSupportedSystems (pkgs: {
      disk = pkgs.writeShellApplication {
        name = "disk";

        runtimeInputs = with pkgs; [
          util-linux
          jq
          e2fsprogs
          dosfstools
        ];

        text = builtins.readFile ./disk.sh;
      };
    });
  };
}
