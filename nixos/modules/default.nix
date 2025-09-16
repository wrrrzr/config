{
  ...
}:

{
  imports = [
    ./networking.nix
    ./packages.nix
    ./bash.nix
    ./waydroid.nix
    ./emulate.nix
    ./zram.nix
    ./desktop.nix
    ./printers.nix
    ./wireguard.nix
    ./users.nix
    ./greetd.nix
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
