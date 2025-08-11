{ ... }:

{
  imports = [
    ./opts.nix
    ./plugins.nix
    ./mappings.nix
    ./diagnostic.nix
    ./lsp.nix
  ];
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    colorschemes.vscode.enable = true;
  };
}
