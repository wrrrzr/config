{
  lib,
  config,
  pkgs,
  ...
}:

let
  cfg = config.module.tv-alarm;
in
{
  options.module.tv-alarm = {
    enable = lib.mkEnableOption "Tv alarm via hdmi-cec";
    package = lib.mkPackageOption pkgs "libcec" { };
  };
  config = lib.mkIf cfg.enable {
    systemd.timers."tv-alarm" = {
      wantedBy = [ "timers.target" ];
      timerConfig = {
        OnCalendar = "07:00";
        Unit = "tv-alarm.service";
      };
    };

    systemd.services."tv-alarm" = {
      script = ''
        echo "on 0" | ${cfg.package}/bin/cec-client -s
      '';
      serviceConfig = {
        Type = "oneshot";
        User = "root";
      };
    };
  };
}
