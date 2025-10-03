{ pkgs, ... }:

{
  home.username = "utopiya";
  home.homeDirectory = "/home/utopiya";
  programs.firefox.enable = true;
  home.packages = with pkgs; [
    ayugram-desktop
    dino
  ];
}
