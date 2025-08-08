{ lib, config, ... }:

let
  cfg = config.module.smbmount;
in
{
  options.module.smbmount = {
    enable = lib.mkEnableOption "Mount smb mount in me dir";
  };
  config = lib.mkIf cfg.enable {
    fileSystems."/home/me/mm" = {
      device = "//10.0.0.5/notes";
      fsType = "cifs";
      depends = [ "wg-quick@wg0.service" ];
      options =
        let
          automount = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";
        in
        [ "${automount},credentials=/etc/nixos/smb-secrets,uid=1000,gid=1000" ];
    };
  };
}
