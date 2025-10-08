{
  config,
  lib,
  modulesPath,
  ...
}:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  nixpkgs.config.allowUnfree = true;

  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.graphics.enable = true;
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    open = false;
  };

  module = {
    networking.enable = true;
    openssh.enable = true;
    wireguard = {
      enable = true;
      address = "10.0.0.3";
    };
    users = {
      enable = true;
      users.tux.enable = true;
    };
  };

  networking.wireless.enable = true;
  networking.wireless.networks = {
    "nashahata" = {
      psk = "Berezan(1616)";
    };
  };

  services.ollama = {
    enable = true;
    acceleration = "cuda";
  };

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/b42518da-f8ad-4e15-94f5-f02f76696eff";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/8623-A2D4";
    fsType = "vfat";
    options = [
      "fmask=0022"
      "dmask=0022"
    ];
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.availableKernelModules = [
    "xhci_pci"
    "ehci_pci"
    "ata_piix"
    "usb_storage"
    "usbhid"
    "sd_mod"
    "sr_mod"
  ];
  boot.kernelModules = [ "kvm-intel" ];
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
