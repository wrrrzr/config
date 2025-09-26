{ inputs, ... }:

{
  imports = [
    ../modules
    ./bash.nix
    ./firefox
    ./git.nix
    ./kitty.nix
    ./mpd.nix
    ./mpv.nix
    ./packages.nix
    ./readline.nix
    ./sway.nix
    ./theme.nix
    ./xdg.nix
    inputs.nixvim.homeModules.nixvim
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
    env.GOPATH = ".go";
  };

  services.blueman-applet.enable = true;

  module = {
    nixvim.enable = true;
  };

  programs.home-manager.enable = true;
}
