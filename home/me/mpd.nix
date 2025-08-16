{ pkgs, ... }:

{
  services.mpd = {
    enable = true;
    musicDirectory = "/home/me/music";
    extraConfig = ''
      audio_output {
        type "pipewire"
        name "Mpd music"
      }
    '';

    network.startWhenNeeded = true;
  };
  home.packages = with pkgs; [ mpc ];
}
