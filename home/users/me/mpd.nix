{ pkgs, config, ... }:

let
  musicDir = config.xdg.userDirs.music;
in
{
  services.mpd = {
    enable = true;
    musicDirectory = "${musicDir}";
    playlistDirectory = "${musicDir}/playlists";
    extraConfig = ''
      auto_update "yes"

      audio_output {
        type "pipewire"
        name "Mpd music"
      }
    '';

    network.startWhenNeeded = true;
  };
  home.packages = with pkgs; [ mpc ];
}
