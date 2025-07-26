{ config, lib, pkgs, ... }:

let emulate = [ "aarch64-linux" ];
in {
  programs.virt-manager.enable = true;

  users.groups.libvirtd.members = [ "me" ];

  virtualisation.libvirtd.enable = true;

  virtualisation.spiceUSBRedirection.enable = true;

  virtualisation.waydroid.enable = true;

  boot.binfmt.emulatedSystems = emulate;
  nix.settings.extra-platforms = emulate;
}
