{
  pkgs,
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
  boot.kernelPackages = pkgs.linuxKernel.packages.linux_rpi4;

  module = {
    emulate = {
      enable = true;
      platforms = [ "x86_64-linux" ];
    };
    network.enable = true;
    wireguard = {
      enable = true;
      address = "10.0.0.5";
    };
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
    "Bruno 5G" = {
      psk = "13031991";
    };
  };

  hardware.raspberry-pi."4" = {
    pwm0.enable = true;
    leds = {
      pwr.disable = true;
      act.disable = true;
    };
  };

  users.users.tux = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFkbZDukqSo/lPT5tHl1cUR4SXs3aUmJ+C7YTQ3ztCf1"
    ];
  };

  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
    };
  };

  environment.enableAllTerminfo = true;
}
