{ lib, config, ... }:

let
  cfg = config.module.forgejo;
in
{
  options.module.forgejo = {
    enable = lib.mkEnableOption "Forgejo server";
  };
  config = lib.mkIf cfg.enable {
    boot.kernel.sysctl = {
      "net.ipv4.ip_unprivileged_port_start" = 0;
    };
    services.forgejo = {
      enable = true;
      database.type = "sqlite3";
      lfs.enable = true;
      settings.server.HTTP_PORT = 80;
    };
  };
}
