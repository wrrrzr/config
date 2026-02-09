{
  config,
  lib,
  modulesPath,
  ...
}:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    ./disks.nix
  ];

  nix.settings.allowed-users = [
    "@wheel"
    "@builders"
  ];

  module = {
    desktop = {
      enable = true;
      xfce.enable = true;
    };
    emulate = {
      enable = true;
      platforms = [ "aarch64-linux" ];
    };
    networking.enable = true;
    wireguard = {
      enable = true;
      address = "10.0.0.2";
    };
    zapret.enable = true;
    security = {
      enable = true;
      disallowCamera = true;
    };
    openssh.enable = true;
    users = {
      enable = true;
      users.wisdom.enable = true;
      users.tux.enable = true;
    };
  };

  services.postgresql.enable = true;
  systemd.targets.postgresql.wantedBy = lib.mkForce [ ];
  services.tlp.enable = true;

  programs.adb.enable = true;
  programs.nix-ld.enable = true;
  hardware.bluetooth.enable = true;
  networking.wireless.iwd = {
    enable = true;
    settings.Settings.AutoConnect = true;
  };
  networking.firewall = {
    enable = true;
    allowPing = false;
    allowedUDPPorts = [ 30000 ];
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.availableKernelModules = [
    "nvme"
    "xhci_pci"
    "rtsx_usb_sdmmc"
  ];
  boot.kernelModules = [ "kvm-amd" ];
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
