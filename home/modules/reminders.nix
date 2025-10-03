{
  config,
  pkgs,
  lib,
  ...
}:

let
  cfg = config.module.reminders;
  reminderType = lib.types.submodule (
    { ... }:
    {
      options = {
        name = lib.mkOption {
          type = lib.types.str;
          description = "Systemd timer and service name";
        };
        program = lib.mkOption {
          type = lib.types.str;
        };
        when = lib.mkOption {
          type = lib.types.str;
        };
      };
    }
  );
  mkService = r: {
    name = "reminder-${r.name}";
    value = {
      Service = {
        Type = "oneshot";
        ExecStart = lib.getExe (
          pkgs.writeShellScriptBin r.name ''${pkgs.libnotify}/bin/notify-send ${r.name} "`${r.program}`"''
        );
      };
    };
  };
  mkTimer = r: {
    name = "reminder-${r.name}";
    value = {
      Timer = {
        OnCalendar = r.when;
        Persistent = true;
        Unit = "reminder-${r.name}.service";
      };
      Install = {
        WantedBy = [ "timers.target" ];
      };
    };
  };
in
{
  options.module.reminders = {
    enable = lib.mkEnableOption "Reminders";
    reminders = lib.mkOption {
      type = lib.types.listOf reminderType;
      default = [ ];
    };
  };
  config = lib.mkIf cfg.enable {
    systemd.user.services = builtins.listToAttrs (builtins.map mkService cfg.reminders);
    systemd.user.timers = builtins.listToAttrs (builtins.map mkTimer cfg.reminders);
  };
}
