{ lib, config, ... }:

let cfg = config.module.desktop;
in {
  options.module.desktop = { enable = lib.mkEnableOption "Desktop things"; };
  config = lib.mkIf cfg.enable {
    services.displayManager.gdm.enable = true;
    services.desktopManager.gnome.enable = true;

    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    services.libinput.enable = true;

    services.xserver = {
      enable = true;
      xkb = {
        layout = "us,ru";
        options = "grp:win_space_toggle";
      };
    };
  };
}
