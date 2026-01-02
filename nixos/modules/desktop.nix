{
  lib,
  config,
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
