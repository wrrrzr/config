{ config, lib, pkgs, ... }:

let
  cfg = config.module.virt;
  emulate = [ "aarch64-linux" ];
in {
  options.module.virt = {
    enable = lib.mkEnableOption "Virt manager and emulate arm64";
  };
  config = lib.mkIf cfg.enable {
    programs.virt-manager.enable = true;

    users.groups.libvirtd.members = [ "me" ];

    virtualisation.libvirtd.enable = true;

    virtualisation.spiceUSBRedirection.enable = true;

    virtualisation.waydroid.enable = true;

    boot.binfmt.emulatedSystems = emulate;
    nix.settings.extra-platforms = emulate;
  };
}
