{
  lib,
  config,
  ...
}:

let
  cfg = config.module.tvbox;
in
{
  options.module.tvbox = {
    enable = lib.mkEnableOption "Tvbox";
    smbshare = lib.mkEnableOption "Smbshare for tvbox";
    openFirewall = lib.mkOption {
      type = lib.types.bool;
      default = false;
      example = true;
      description = "Whether to open the port in the firewall.";
    };
  };
  config = lib.mkIf cfg.enable {
    users.users.tvbox.isNormalUser = true;
    services.xserver.enable = true;
    services.xserver.desktopManager.kodi.enable = true;
    services.displayManager.autoLogin.user = "tvbox";
    services.xserver.displayManager.lightdm.greeter.enable = false;

    services.samba = lib.mkIf cfg.smbshare {
      enable = true;
      openFirewall = cfg.openFirewall;
      settings = {
        global = {
          "workgroup" = "WORKGROUP";
          "server string" = "tvbox";
          "netbios name" = "tvbox";
          "security" = "user";
          "hosts allow" = "0.0.0.0/0";
          "guest account" = "nobody";
          "map to guest" = "bad user";
        };
        "Media" = {
          "path" = "/tvmedia";
          "browseable" = "yes";
          "read only" = "no";
          "guest ok" = "no";
          "create mask" = "0644";
          "directory mask" = "0755";
          "force user" = "tvbox";
          "force group" = "users";
        };
      };
    };

    services.samba-wsdd = lib.mkIf cfg.smbshare {
      enable = true;
      openFirewall = cfg.openFirewall;
    };

    networking.firewall = lib.mkIf cfg.openFirewall {
      allowedTCPPorts = [ 8080 ];
      allowedUDPPorts = [ 8080 ];
    };
  };
}
