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
    ./desktop
    ./emulate.nix
    ./networking.nix
    ./openssh.nix
    ./packages.nix
    ./printers.nix
    ./screen.nix
    ./security.nix
    ./transmission.nix
    ./unfree.nix
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
  services.journald.extraConfig = "SystemMaxUse=100M";

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  i18n = {
    defaultLocale = lib.mkDefault "en_US.UTF-8";
    extraLocaleSettings = {
      LC_TIME = lib.mkDefault "en_GB.UTF-8";
    };
  };
  time.timeZone = lib.mkDefault "Europe/Moscow";

  system.stateVersion = stateVersion;
}
