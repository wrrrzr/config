{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.module.emulate;
  emulate = [ "aarch64-linux" ];
in
{
  options.module.emulate = {
    enable = lib.mkEnableOption "Emulate arm64 system";
  };
  config = lib.mkIf cfg.enable {
    boot.binfmt.emulatedSystems = emulate;
    nix.settings.extra-platforms = emulate;
  };
}
