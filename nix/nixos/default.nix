{ config, lib, pkgs, ... }:

{
  imports = [
    ./networking.nix
    ./packages.nix
    ./bash.nix
    ./virt.nix
    ./zram.nix
    ./desktop.nix
    ./printers.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  time.timeZone = "Europe/Moscow";

  system.stateVersion = "24.11";
}
