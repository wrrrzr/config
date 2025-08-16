{ ... }:

{
  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      music = "$HOME/music";
      desktop = "$HOME/desktop";
      download = "$HOME/downloads";
      pictures = "/dev/null";
      templates = "/dev/null";
      publicShare = "/dev/null";
      documents = "/dev/null";
      videos = "/dev/null";
    };
  };
}
