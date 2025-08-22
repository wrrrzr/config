{
  lib,
  modulesPath,
  ...
}:

{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot.initrd.availableKernelModules = [ "xhci_pci" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];

  module = {
    emulate = {
      enable = true;
      platforms = [ "x86_64-linux" ];
    };
    network.wg.address = "10.0.0.5";
  };

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/44444444-4444-4444-8888-888888888888";
    fsType = "ext4";
  };

  swapDevices = [ ];

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "aarch64-linux";

  networking.wireless.enable = true;
  networking.wireless.networks = {
    "marinad 5G" = {
      psk = "13031991";
    };
  };

  hardware.raspberry-pi."4".leds = {
    pwr.disable = true;
    act.disable = true;
  };

  users.users.tux = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  environment.enableAllTerminfo = true;

  services.openssh.enable = true;
}
