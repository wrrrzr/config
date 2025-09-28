{ lib, inputs, ... }:

{
  imports = [
    ./diagnostic.nix
    ./editor.nix
    ./hardmode.nix
    ./mappings.nix
    ./opts.nix
    ./plugins
    inputs.nixvim.homeModules.nixvim
  ];
  options.module.nixvim = {
    enable = lib.mkEnableOption "Neovim config";
  };
}
