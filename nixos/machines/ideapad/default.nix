{
  config,
  lib,
  modulesPath,
  ...
}:

let
  locale = "ru_RU.UTF-8";
in
{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  services = {
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  i18n.defaultLocale = locale;
  i18n.extraLocaleSettings = {
    LC_CTYPE = locale;
    LC_ADDRESS = locale;
    LC_MEASUREMENT = locale;
    LC_MESSAGES = locale;
    LC_MONETARY = locale;
    LC_NAME = locale;
    LC_NUMERIC = locale;
    LC_PAPER = locale;
    LC_TELEPHONE = locale;
    LC_TIME = locale;
    LC_COLLATE = locale;
  };

  module = {
    networking.enable = true;
    openssh.enable = true;
    desktop.enable = true;
    users = {
      enable = true;
      users.utopiya.enable = true;
      users.tux.enable = true;
    };
    wireguard = {
      enable = true;
      address = "10.0.0.7";
    };
    zapret.enable = true;
  };

  networking.networkmanager.enable = true;

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/b5a9b64b-3b08-4560-a79a-0f6c4ce50575";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/4BC2-33A0";
    fsType = "vfat";
    options = [
      "fmask=0022"
      "dmask=0022"
    ];
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.plymouth.enable = true;
  boot.loader.timeout = 0;
  boot.kernelParams = [
    "quiet"
  ];
  boot.initrd.availableKernelModules = [
    "xhci_pci"
    "nvme"
    "usb_storage"
    "sd_mod"
    "sdhci_pci"
  ];
  boot.blacklistedKernelModules = [ "elan_i2c" ];
  boot.kernelModules = [ "kvm-intel" ];
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
