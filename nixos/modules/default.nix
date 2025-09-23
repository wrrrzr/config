{
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
    ./users.nix
    ./waydroid.nix
    ./wireguard.nix
    ./zram.nix
  ];

  users.mutableUsers = false;
  users.users.root.hashedPasswordFile = "/etc/secret/rootpasswd";
  boot.tmp.useTmpfs = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  time.timeZone = "Europe/Moscow";

  system.stateVersion = "24.11";
}
