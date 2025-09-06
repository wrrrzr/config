{
  config,
  lib,
  modulesPath,
  ...
}:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    ./boot.nix
    ./disks.nix
  ];

  users.users.me = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
    hashedPasswordFile = "/etc/secret/mepasswd";
  };

  module = {
    desktop.enable = true;
    emulate = {
      enable = true;
      platforms = [ "aarch64-linux" ];
    };
    network.enable = true;
    wireguard = {
      enable = true;
      address = "10.0.0.2";
    };
  };

  services.postgresql.enable = true;

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

  networking.interfaces.enp1s0.name = "eth0";

  boot.initrd.availableKernelModules = [
    "nvme"
    "xhci_pci"
    "rtsx_usb_sdmmc"
  ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
