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
  };

  module = {
    desktop.enable = true;
    emulate = {
      enable = true;
      platforms = [ "aarch64-linux" ];
    };
    network.wg.address = "10.0.0.2";
  };

  services.postgresql.enable = true;

  services.tlp.enable = true;

  programs.adb.enable = true;

  programs.nix-ld.enable = true;

  hardware.bluetooth.enable = true;

  networking.networkmanager.enable = true;

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
