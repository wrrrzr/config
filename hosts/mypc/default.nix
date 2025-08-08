{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    ./boot.nix
  ];

  boot.kernel.sysctl = {
    "net.ipv4.ip_unprivileged_port_start" = 0;
  };

  users.users.me = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
  };

  module = {
    desktop.enable = true;
    smbmount.enable = true;
    virt.enable = true;
    network.wg.address = "10.0.0.2";
  };

  services.byedpi = {
    enable = true;
    params = "--split 1 --disorder 3+s --mod-http=h,d --auto=torst --tlsrec 1+s --ip 127.0.0.1";
  };

  environment.systemPackages = with pkgs; [ python3Packages.argostranslate ];

  services.postgresql.enable = true;

  programs.adb.enable = true;

  programs.nix-ld.enable = true;

  hardware.bluetooth.enable = true;

  networking.networkmanager.enable = true;

  services.forgejo = {
    enable = true;
    database.type = "sqlite3";
    lfs.enable = true;
    settings.server.HTTP_PORT = 80;
  };

  boot.initrd.availableKernelModules = [
    "nvme"
    "xhci_pci"
    "rtsx_usb_sdmmc"
  ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/87cb5ee8-9e76-42bd-a347-ce4f890139d9";
    fsType = "ext4";
  };

  fileSystems."/boot/efi" = {
    device = "/dev/disk/by-uuid/1AC0-4B9C";
    fsType = "vfat";
    options = [
      "fmask=0022"
      "dmask=0022"
    ];
  };

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
