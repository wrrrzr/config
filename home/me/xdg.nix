{ ... }:

let
  t = "/tmp/me-trash";
in
{
  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      music = "$HOME/music";
      download = "$HOME/downloads";
      videos = t;
      desktop = t;
      pictures = t;
      templates = t;
      documents = t;
      publicShare = t;
    };
  };
}
