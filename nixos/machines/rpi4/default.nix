{
  pkgs,
  lib,
  modulesPath,
  inputs,
  ...
}:

let
  rpi-libcec = (pkgs.libcec.override { withLibraspberrypi = true; });
in
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
    networking.enable = true;
    openssh.enable = true;
    wireguard = {
      enable = true;
      address = "10.0.0.5";
    };
    tv-alarm = {
      enable = true;
      package = rpi-libcec;
    };
    tvbox = {
      enable = true;
      smbshare = true;
      openFirewall = true;
    };
    transmission.enable = true;
    avahi.enable = true;
    users = {
      enable = true;
      users.tux.enable = true;
    };
  };

  networking.wireless.enable = true;
  networking.wireless.networks = {
    "Bruno" = {
      psk = "13031991";
    };
  };

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  environment.systemPackages = with pkgs; [
    rpi-libcec
    libraspberrypi
  ];

  hardware = {
    deviceTree = {
      enable = true;
      filter = lib.mkForce "*rpi-4-*.dtb";
    };
    raspberry-pi."4" = {
      pwm0.enable = true;
      fkms-3d.enable = true;
      bluetooth.enable = true;
      leds = {
        pwr.disable = true;
        act.disable = true;
      };
    };
    bluetooth.enable = true;
  };

  boot.plymouth.enable = true;
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
