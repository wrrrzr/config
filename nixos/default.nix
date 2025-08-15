{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./networking.nix
    ./packages.nix
    ./bash.nix
    ./virt.nix
    ./waydroid.nix
    ./emulate.nix
    ./zram.nix
    ./desktop.nix
    ./printers.nix
    ./byedpi.nix
    ./forgejo.nix
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  time.timeZone = "Europe/Moscow";

  system.stateVersion = "24.11";
}
