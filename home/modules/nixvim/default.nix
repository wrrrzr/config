{ lib, ... }:

{
  imports = [
    ./diagnostic.nix
    ./editor.nix
    ./hardmode.nix
    ./mappings.nix
    ./opts.nix
    ./plugins
  ];
  options.module.nixvim = {
    enable = lib.mkEnableOption "Neovim config";
  };
}
