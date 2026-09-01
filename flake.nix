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

    nixos-hardware = {
      url = "github:NixOS/nixos-hardware/master";
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
        }:
        inputs.nixpkgs.lib.nixosSystem {
          system = system;
          specialArgs = {
            inherit hostname system inputs;
            stateVersion = "25.05";
            pubkeys = {
              sshkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFkbZDukqSo/lPT5tHl1cUR4SXs3aUmJ+C7YTQ3ztCf1";
              installerkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIxVzlnNIpKHwyy6Yw5lctgo0JplO0AXtuiDYVzy5A0s";
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
        maibenbenm543 = makeSystem {
          hostname = "maibenbenm543";
          system = "x86_64-linux";
        };
        thinkpadt14s = makeSystem {
          hostname = "thinkpadt14s";
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
        installer = makeSystem {
          hostname = "installer";
          system = "x86_64-linux";
        };
      };
    };
}
