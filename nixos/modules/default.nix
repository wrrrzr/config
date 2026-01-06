{
  lib,
  system,
  stateVersion,
  ...
}:

{
  imports = [
    ./avahi.nix
    ./bash.nix
    ./desktop.nix
    ./emulate.nix
    ./hass.nix
    ./networking.nix
    ./openssh.nix
    ./packages.nix
    ./printers.nix
    ./security.nix
    ./sway.nix
    ./transmission.nix
    ./tv-alarm.nix
    ./tvbox.nix
    ./users.nix
    ./waydroid.nix
    ./wireguard.nix
    ./zapret.nix
    ./zram.nix
  ];

  programs.vim = {
    enable = true;
    defaultEditor = true;
  };

  nixpkgs.hostPlatform = lib.mkDefault system;
  users.mutableUsers = false;
  users.users.root.hashedPasswordFile = "/etc/secret/passwd/root";
  boot.tmp.useTmpfs = true;
  boot.kernel.sysctl."kernel.sysrq" = 1;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  time.timeZone = "Europe/Moscow";

  system.stateVersion = stateVersion;
}
