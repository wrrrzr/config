{
  lib,
  system,
  stateVersion,
  ...
}:

{
  imports = [
    ./bash.nix
    ./desktop.nix
    ./emulate.nix
    ./greetd.nix
    ./networking.nix
    ./packages.nix
    ./printers.nix
    ./tv-alarm.nix
    ./tvbox.nix
    ./users.nix
    ./waydroid.nix
    ./wireguard.nix
    ./zram.nix
  ];

  nixpkgs.hostPlatform = lib.mkDefault system;
  users.mutableUsers = false;
  users.users.root.hashedPasswordFile = "/etc/secret/passwd/root";
  boot.tmp.useTmpfs = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  time.timeZone = "Europe/Moscow";

  system.stateVersion = stateVersion;
}
