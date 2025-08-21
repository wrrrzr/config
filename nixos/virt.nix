{
  config,
  lib,
  ...
}:

let
  cfg = config.module.virt;
in
{
  options.module.virt = {
    enable = lib.mkEnableOption "Virt manager";
    users = lib.mkOption {
      type = with lib.types; listOf (passwdEntry str);
      default = [ ];
      description = "Users that can use virt-manager";
    };
  };
  config = lib.mkIf cfg.enable {
    programs.virt-manager.enable = true;

    virtualisation.libvirtd.enable = true;

    users.groups.libvirtd.members = cfg.users;

    virtualisation.spiceUSBRedirection.enable = true;
  };
}
