{
  config,
  lib,
  ...
}:

let
  cfg = config.module.emulate;
in
{
  options.module.emulate = {
    enable = lib.mkEnableOption "Emulate arm64 system";
    platforms = lib.mkOption {
      type = with lib.types; listOf str;
      example = [ "aarch64-linux" ];
      description = "Platforms to emulate";
    };
  };
  config = lib.mkIf cfg.enable {
    boot.binfmt.emulatedSystems = cfg.platforms;
    nix.settings.extra-platforms = cfg.platforms;
  };
}
