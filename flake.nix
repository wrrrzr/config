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
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      nixvim,
      firefox-addons,
      nixos-hardware,
      nixos-generators,
      ...
    }:
    let
      makeSystem =
        {
          hostname,
          system,
          extraModules ? [ ],
        }:
        nixpkgs.lib.nixosSystem {
          system = system;
          specialArgs = { inherit hostname; };

          modules = [
            ./hosts/${hostname}
            ./nixos
          ]
          ++ extraModules;
        };
      makeHome =
        {
          username,
          system,
          extraModules ? [ ],
        }:
        home-manager.lib.homeManagerConfiguration {
          extraSpecialArgs = {
            inherit firefox-addons system;
          };
          pkgs = nixpkgs.legacyPackages.${system};
          modules = [
            ./home/${username}
            ./home/modules
            nixvim.homeModules.nixvim
          ]
          ++ extraModules;
        };
    in
    {
      nixosConfigurations = {
        mypc = makeSystem {
          hostname = "mypc";
          system = "x86_64-linux";
        };
        rpi4 = makeSystem {
          hostname = "rpi4";
          system = "aarch64-linux";
          extraModules = [ nixos-hardware.nixosModules.raspberry-pi-4 ];
        };
      };
      homeConfigurations = {
        me = makeHome {
          username = "me";
          system = "x86_64-linux";
        };
      };
      packages.x86_64-linux.installer = nixos-generators.nixosGenerate {
        system = "x86_64-linux";
        format = "iso";
        modules = [ ./installer ];
      };
    };
}
