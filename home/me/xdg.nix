{ ... }:

{
  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      music = "$HOME/music";
      download = "$HOME/downloads";
      videos = "/dev/null";
      desktop = "/dev/null";
      pictures = "/dev/null";
      templates = "/dev/null";
      documents = "/dev/null";
      publicShare = "/dev/null";
    };
  };
}
