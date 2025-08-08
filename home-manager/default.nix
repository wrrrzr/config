{ config, pkgs, ... }:

{
  imports = [
    ./packages.nix
    ./bash.nix
    ./git.nix
    ./theme.nix
    ./gnome.nix
    ./sway.nix
    ./kitty.nix
    ./fastfetch.nix
    ./nixvim
  ];
  home.username = "me";
  home.homeDirectory = "/home/me";

  home.stateVersion = "24.11";

  home.sessionVariables = {
    NIX_SHELL_PRESERVE_PROMPT = 1;
  };

  fonts.fontconfig.enable = true;

  programs.readline = {
    enable = true;
    bindings = {
      "\\C-H" = "backward-kill-word";
    };
    variables = {
      mark-symlinked-directories = true;
    };
  };

  programs.go = {
    enable = true;
    goPath = ".go";
  };

  programs.home-manager.enable = true;
}
