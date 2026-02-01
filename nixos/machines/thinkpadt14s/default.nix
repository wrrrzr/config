{
  config,
  lib,
  modulesPath,
  inputs,
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
      address = "10.0.0.9";
    };
    security = {
      enable = true;
      disallowCamera = true;
    };
    users = {
      enable = true;
      users.me.enable = true;
    };
  };

  services.timesyncd.enable = false;
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
    "xhci_pci"
    "nvme"
    "usb_storage"
    "sd_mod"
    "sdhci_pci"
  ];
  boot.kernelModules = [ "kvm-intel" ];
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
