{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userEmail = "wozrer@proton.me";
    userName = "wrrrzr";
  };
}
