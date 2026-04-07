{ ... }:

let
  mpv = {
    no = "no";
    yes = "yes";
  };
in
{
  programs.mpv = {
    enable = true;
    config = {
      audio-display = mpv.no;
      deband = mpv.yes;
      save-position-on-quit = mpv.yes;
    };
  };
}
