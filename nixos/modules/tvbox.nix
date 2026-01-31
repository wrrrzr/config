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
    boot.plymouth.enable = true;

    networking.firewall = lib.mkIf cfg.openFirewall {
      allowedTCPPorts = [ 8080 ];
      allowedUDPPorts = [ 8080 ];
    };
  };
}
