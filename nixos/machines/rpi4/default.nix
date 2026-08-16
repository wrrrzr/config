{
  pkgs,
  lib,
  modulesPath,
  inputs,
  ...
}:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    inputs.nixos-hardware.nixosModules.raspberry-pi-4
  ];

  module = {
    emulate = {
      enable = true;
      platforms = [ "x86_64-linux" ];
    };
    networking = {
      enable = true;
      nftables.enable = true;
    };
    openssh.enable = true;
    screen.enable = true;
    transmission.enable = true;
    wireguard = {
      enable = true;
      address = "10.20.30.6/32";
    };
    avahi.enable = true;
    users = {
      enable = true;
      home-manager = true;
      users.tux.enable = true;
    };
  };

  networking = {
    useNetworkd = true;
    wireless = {
      enable = true;
      networks."Bruno".psk = "13031991";
    };
  };

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  hardware = {
    deviceTree = {
      enable = true;
      filter = lib.mkForce "*rpi-4-*.dtb";
    };
    raspberry-pi."4" = {
      pwm0.enable = true;
      leds = {
        pwr.disable = true;
        act.disable = true;
      };
    };
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.loader.timeout = 0;
  boot.kernelParams = [
    "quiet"
    "snd_bcm2835.enable_hdmi=1"
  ];
  boot.initrd.availableKernelModules = [ "xhci_pci" ];
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/44444444-4444-4444-8888-888888888888";
    fsType = "ext4";
  };
}
