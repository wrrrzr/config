{
  lib,
  config,
  pkgs,
  ...
}:

let
  cfg = config.module.samba;
in
{
  options.module.samba = {
    enable = lib.mkEnableOption "Samba";
    allowUsers = lib.mkEnableOption "Users" // {
      default = true;
    };
  };
  config = lib.mkIf cfg.enable {
    services.samba = {
      enable = true;
      package = pkgs.samba4Full;
      openFirewall = true;
      usershares.enable = cfg.allowUsers;
    };
    services.samba-wsdd = {
      enable = true;
      openFirewall = true;
    };
    module.users.extraGroups = lib.mkIf cfg.allowUsers [ "samba" ];
  };
}
