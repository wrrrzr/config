{ config, pkgs, ... }:

{
  imports = [ ./packages.nix ./bash.nix ./git.nix ./theme.nix ];
  home.username = "me";
  home.homeDirectory = "/home/me";

  home.stateVersion = "24.11";

  home.sessionVariables = { EDITOR = "vim"; };

  fonts.fontconfig.enable = true;

  programs.home-manager.enable = true;
}
