{ config, lib, pkgs, ... }:

{
  programs.sway = {
    enable = true;
    extraPackages = [
      pkgs.wmenu
      pkgs.playerctl
      pkgs.brightnessctl
      pkgs.pulseaudio
      pkgs.grim
      pkgs.swaylock
      pkgs.swaynotificationcenter
      pkgs.imv
      pkgs.mpv
    ];
  };

  systemd.user.units.swaync.enable = true;
}
