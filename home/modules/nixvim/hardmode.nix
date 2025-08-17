{ config, lib, ... }:

let
  cfg = config.module.nixvim-hardmode;
  mkKeymap = key: {
    key = key;
    mode = [
      "n"
      "i"
      "v"
    ];
    action = "";
  };
in
{
  options.module.nixvim-hardmode = {
    enable = lib.mkEnableOption "Nixvim hardmode";
  };
  config = lib.mkIf cfg.enable {
    programs.nixvim = {
      opts.mouse = "";
      keymaps = builtins.map mkKeymap [
        "<UP>"
        "<Left>"
        "<Right>"
        "<Down>"
        "<C-UP>"
        "<C-Left>"
        "<C-Right>"
        "<C-Down>"
      ];
    };
  };
}
