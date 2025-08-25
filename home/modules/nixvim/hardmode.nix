{ config, lib, ... }:

let
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
  config = lib.mkIf config.module.nixvim.enable {
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
