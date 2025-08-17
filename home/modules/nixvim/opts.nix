{ config, lib, ... }:

let
  cfg = config.module.nixvim-opts;
in
{
  options.module.nixvim-opts = {
    enable = lib.mkEnableOption "Nixvim opts";
  };
  config = lib.mkIf cfg.enable {
    programs.nixvim = {
      opts = {
        number = true;
        tabstop = 4;
        shiftwidth = 4;
        smarttab = true;
        expandtab = true;
        termguicolors = true;
      };
      clipboard = {
        register = "unnamedplus";
        providers.wl-copy.enable = true;
      };
    };
  };
}
