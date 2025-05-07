{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./boot.nix
    ./networking.nix
    ./users.nix
    ./packages.nix
    ./sway.nix
    ./bash.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  time.timeZone = "Europe/Moscow";

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.libinput.enable = true;

  services.xserver = {
    enable = true;
    xkb = {
      layout = "us,ru";
      options = "grp:win_space_toggle";
    };
  };

  services.postgresql.enable = true;

  services.tlp.enable = true;

  services.ollama.enable = true;

  zramSwap.enable = true;
  zramSwap.memoryPercent = 100;

  programs.steam.enable = true;

  programs.adb.enable = true;

  programs.nix-ld.enable = true;

  programs.virt-manager.enable = true;

  programs.kdeconnect.enable = true;

  virtualisation.libvirtd.enable = true;

  virtualisation.spiceUSBRedirection.enable = true;

  hardware.bluetooth.enable = true;

  system.stateVersion = "24.11";
}
