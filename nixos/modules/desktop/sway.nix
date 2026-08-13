{
  lib,
  config,
  pkgs,
  ...
}:

let
  isEnabled = (config.module.desktop.enable && config.module.desktop.sway.enable);

  apps = {
    "imv.desktop" = [
      "image/apng"
      "image/avif"
      "image/bmp"
      "image/gif"
      "image/jpeg"
      "image/png"
      "image/svg+xml"
      "image/tiff"
      "image/vnd.microsoft.icon"
      "image/webp"
    ];
    "firefox.desktop" = [
      "text/html"
      "x-scheme-handler/about"
      "x-scheme-handler/http"
      "x-scheme-handler/https"
      "x-scheme-handler/unknown"
    ];
    "mpv.desktop" = [
      "video/3gpp"
      "video/3gpp2"
      "video/mp2t"
      "video/mp4"
      "video/mpeg"
      "video/ogg"
      "video/webm"
      "video/x-msvideo"
    ];
    "org.gnome.Evince.desktop" = [
      "application/pdf"
    ];
    "thunar.desktop" = [
      "inode/directory"
    ];
  };
  defaultApplications = builtins.foldl' (
    acc: app:
    acc
    // builtins.listToAttrs (
      map (mime: {
        name = mime;
        value = app;
      }) apps.${app}
    )
  ) { } (builtins.attrNames apps);
in
{
  config = lib.mkIf isEnabled {
    services.xserver.displayManager.lightdm.enable = false;
    security.pam.services.swaylock = { };
    xdg.mime = {
      enable = true;
      defaultApplications = defaultApplications;
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
      ]
    );
    programs.thunar = {
      enable = true;
      plugins = with pkgs; [
        thunar-archive-plugin
        thunar-media-tags-plugin
        thunar-shares-plugin
      ];
    };
    services.tumbler.enable = true;
    services.blueman.enable = true;
  };
}
