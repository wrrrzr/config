{
  config,
  lib,
  modulesPath,
  inputs,
  pkgs,
  ...
}:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t14s
    ./disks.nix
  ];

  nix.settings.allowed-users = [
    "@wheel"
    "@builders"
  ];

  module = {
    desktop = {
      enable = true;
      appimageRuntime = true;
      sway.enable = true;
    };
    emulate = {
      enable = true;
      platforms = [ "aarch64-linux" ];
    };
    networking = {
      enable = true;
      nftables.enable = true;
    };
    wireguard = {
      enable = true;
      address = "10.20.30.2";
    };
    security = {
      enable = true;
      disallowCamera = true;
    };
    users = {
      enable = true;
      networkmanager = true;
      users.me.enable = true;
    };
    printers = {
      enable = true;
      allowUnfreeHplip = true;
    };
    waydroid.enable = true;
  };

  services.syncthing = {
    enable = true;
    user = "me";
    dataDir = "/home/me/.config/syncthing";
    configDir = "/home/me/.config/syncthing";
    openDefaultPorts = true;
  };

  environment.systemPackages = with pkgs; [ android-tools ];

  services.power-profiles-daemon.enable = true;
  services.gnome.gnome-keyring.enable = true;

  programs.nix-ld.enable = true;
  hardware.bluetooth.enable = true;
  networking = {
    networkmanager = {
      enable = true;
      dns = "systemd-resolved";
      wifi.backend = "iwd";
    };
    firewall = {
      enable = true;
      allowPing = false;
      allowedUDPPorts = [ 30000 ];
    };
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.availableKernelModules = [
    "xhci_pci"
    "nvme"
    "usb_storage"
    "sd_mod"
    "sdhci_pci"
  ];
  boot.kernelModules = [ "kvm-intel" ];
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
