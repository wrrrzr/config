{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.module.virt;
in
{
  options.module.virt = {
    enable = lib.mkEnableOption "Virt manager";
  };
  config = lib.mkIf cfg.enable {
    programs.virt-manager.enable = true;

    virtualisation.libvirtd.enable = true;

    virtualisation.spiceUSBRedirection.enable = true;

    virtualisation.waydroid.enable = true;
  };
}
