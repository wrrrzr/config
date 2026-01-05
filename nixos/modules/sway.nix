{
  lib,
  config,
  pkgs,
  ...
}:

let
  isEnabled = (config.module.desktop.enable && config.module.desktop.sway.enable);
in
{
  config = lib.mkIf isEnabled {
    security.pam.services.swaylock = { };
    xdg.mime = {
      enable = true;
      defaultApplications = {
        "text/html" = "firefox.desktop";
        "x-scheme-handler/about" = "firefox.desktop";
        "x-scheme-handler/http" = "firefox.desktop";
        "x-scheme-handler/https" = "firefox.desktop";
        "x-scheme-handler/unknown" = "firefox.desktop";
        "image/jpeg" = "imv.desktop";
        "image/png" = "imv.desktop";
        "video/mp4" = "mpv.desktop";
        "application/pdf" = "org.gnome.Evince.desktop";
        "inode/directory" = "thunar.desktop";
      };
    };
    xdg.portal = {
      enable = true;
      wlr.enable = true;
      extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
      config.common.default = "*";
    };
    environment.systemPackages = (
      with pkgs;
      [
        firefox
        imv
        mpv
        evince
        xfce.thunar
      ]
    );
    services.tumbler.enable = true;
    services.blueman.enable = true;
  };
}
