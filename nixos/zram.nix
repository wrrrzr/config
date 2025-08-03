{ lib, config, ... }:

let cfg = config.module.zram;
in {
  options.module.zram = {
    enable = lib.mkEnableOption "Ram compression swap" // { default = true; };
  };
  config = lib.mkIf cfg.enable {
    zramSwap.enable = true;
    zramSwap.memoryPercent = 100;
  };
}
