{ lib, config, pkgs, ... }:

let cfg = config.services.byedpi;
in {
  options.services.byedpi = {
    enable = lib.mkEnableOption "the ByeDPI service";
    package = lib.mkPackageOption pkgs "byedpi" { };
    params = lib.mkOption {
      default = "";
      type = lib.types.str;
      example =
        "--split 1 --disorder 3+s --mod-http=h,d --auto=torst --tlsrec 1+s";
      description = "Specify the bypass parameters for ByeDPI binary.";
    };
  };
  config = lib.mkIf cfg.enable {
    systemd.services.byedpi = {
      description = "ByeDPI";
      wantedBy = [ "default.target" ];
      wants = [ "network-online.target" ];
      after = [ "network-online.target" "nss-lookup.target" ];
      serviceConfig = {
        ExecStart = "${cfg.package}/bin/ciadpi ${cfg.params}";
        NoNewPrivileges = "yes";
        StandardOutput = "null";
        StandardError = "journal";
        TimeoutStopSec = "5s";
        PrivateTmp = "true";
        ProtectSystem = "full";
      };
    };
  };
}
