{ config, pkgs, ... }:

{
  imports = [
    ./packages.nix
    ./bash.nix
    ./git.nix
    ./theme.nix
    ./sway.nix
    ./kitty.nix
    ./fastfetch.nix
    ./mpv.nix
    ./readline.nix
    ./nixvim
  ];
  home.username = "me";
  home.homeDirectory = "/home/me";

  home.stateVersion = "24.11";

  home.sessionVariables = {
    NIX_SHELL_PRESERVE_PROMPT = 1;
  };

  fonts.fontconfig.enable = true;

  programs.go = {
    enable = true;
    goPath = ".go";
  };

  programs.home-manager.enable = true;
}
