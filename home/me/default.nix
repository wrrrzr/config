{ ... }:

{
  imports = [
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
  ];
  home.username = "me";
  home.homeDirectory = "/home/me";

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
    reminders = {
      enable = true;
      reminders = [
        {
          name = "water";
          program = "echo drink water";
          when = "*-*-* *:0/30:00";
        }
      ];
    };
  };
}
