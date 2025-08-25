{ config, lib, ... }:

{
  config = lib.mkIf config.module.nixvim.enable {
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
