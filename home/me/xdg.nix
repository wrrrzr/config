{ config, ... }:

let
  home = config.home.homeDirectory;
in
{
  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      desktop = "${home}";
      documents = "${home}/save/documents";
      download = "${home}/downloads";
      music = "${home}/music";
      pictures = "${home}/save/images";
      publicShare = "${home}/save/public";
      templates = "${home}/save/templates";
      videos = "${home}/save/videos";
    };
  };
}
