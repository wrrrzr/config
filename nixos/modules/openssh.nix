{
  config,
  lib,
  ...
}:

let
  cfg = config.module.openssh;
in
{
  options.module.openssh = {
    enable = lib.mkEnableOption "Openssh";
  };
  config = lib.mkIf cfg.enable {
    services.openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = false;
      };
    };
  };
}
