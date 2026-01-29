{
  lib,
  config,
  pkgs,
  ...
}:

let
  isEnabled = (config.module.desktop.enable && config.module.desktop.xfce.enable);
in
{
  config = lib.mkIf isEnabled {
    services.xserver = {
      enable = true;
      desktopManager.xfce.enable = true;
      displayManager.lightdm.enable = true;
    };
    xdg.portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
        xdg-desktop-portal-gnome
      ];
      config.common.default = "*";
    };
    services.displayManager.defaultSession = "xfce";
  };
}
