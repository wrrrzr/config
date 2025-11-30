{
  lib,
  config,
  pkgs,
  ...
}:

let
  cfg = config.module.desktop;
in
{
  options.module.desktop = {
    enable = lib.mkEnableOption "Desktop things";
    sway = {
      enable = lib.mkEnableOption "Sway things";
    };
  };
  config = lib.mkIf cfg.enable {
    hardware.graphics.enable = true;
    security.rtkit.enable = true;
    security.polkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    security.pam.services.swaylock = lib.mkIf cfg.sway.enable { };
    xdg.mime = lib.mkIf cfg.sway.enable {
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
      };
    };
    xdg.portal = lib.mkIf cfg.sway.enable {
      enable = true;
      wlr.enable = true;
      extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
      config.common.default = "*";
    };
    environment.systemPackages = lib.mkIf cfg.sway.enable (
      with pkgs;
      [
        firefox
        imv
        mpv
        evince
      ]
    );

    services.flatpak.enable = true;
    programs.dconf.enable = true;
    services.libinput.enable = true;
    services.xserver = {
      enable = true;
      displayManager.lightdm.enable = false;
      xkb = {
        layout = "us,ru";
        options = "grp:win_space_toggle";
      };
    };
  };
}
