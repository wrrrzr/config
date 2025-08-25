{ lib, ... }:

{
  imports = [
    ./opts.nix
    ./editor.nix
    ./hardmode.nix
    ./mappings.nix
    ./diagnostic.nix
    ./plugins
  ];
  options.module.nixvim = {
    enable = lib.mkEnableOption "Neovim config";
  };
}
