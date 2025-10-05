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

    openwrt-imagebuilder = {
      url = "github:astro/nix-openwrt-imagebuilder";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    mysecrets = {
      url = "path:/secrets";
      flake = false;
    };
  };

  outputs =
    inputs:
    let
      makeSystem =
        {
          hostname,
          system,
        }:
        inputs.nixpkgs.lib.nixosSystem {
          system = system;
          specialArgs = {
            inherit hostname system inputs;
            stateVersion = "25.05";
            mylib = {
              readSecret =
                secret: inputs.nixpkgs.lib.removeSuffix "\n" (builtins.readFile "${inputs.mysecrets}/${secret}");
            };
          };

          modules = [
            ./nixos/machines/${hostname}
            ./nixos/modules
          ];
        };
    in
    {
      nixosConfigurations = {
        mypc = makeSystem {
          hostname = "mypc";
          system = "x86_64-linux";
        };
        neo = makeSystem {
          hostname = "neo";
          system = "x86_64-linux";
        };
        ideapad = makeSystem {
          hostname = "ideapad";
          system = "x86_64-linux";
        };
        rpi4 = makeSystem {
          hostname = "rpi4";
          system = "aarch64-linux";
        };
      };
      packages.x86_64-linux.installer = inputs.nixos-generators.nixosGenerate {
        system = "x86_64-linux";
        format = "iso";
        modules = [ ./installer ];
      };
      packages.x86_64-linux.tplink_archer-c50-v1 =
        let
          pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
          profiles = inputs.openwrt-imagebuilder.lib.profiles { inherit pkgs; };
          config = profiles.identifyProfile "tplink_archer-c50-v1" // {
            packages = [ "openssh-sftp-server" ];
          };
        in
        inputs.openwrt-imagebuilder.lib.build config;
    };
}
