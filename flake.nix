{
  description = "My system config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs:
    let
      makeSystem =
        {
          hostname,
          system,
          extraModules ? [ ],
        }:
        inputs.nixpkgs.lib.nixosSystem {
          system = system;
          specialArgs = { inherit hostname system inputs; };

          modules = [
            ./nixos/machines/${hostname}
            ./nixos/modules
          ]
          ++ extraModules;
        };
    in
    {
      nixosConfigurations = {
        mypc = makeSystem {
          hostname = "mypc";
          system = "x86_64-linux";
          extraModules = [
            inputs.disko.nixosModules.disko
          ];
        };
        rpi4 = makeSystem {
          hostname = "rpi4";
          system = "aarch64-linux";
          extraModules = [ inputs.nixos-hardware.nixosModules.raspberry-pi-4 ];
        };
      };
      packages.x86_64-linux.installer = inputs.nixos-generators.nixosGenerate {
        system = "x86_64-linux";
        format = "iso";
        modules = [ ./installer ];
      };
    };
}
