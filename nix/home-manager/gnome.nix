{ config, pkgs, ... }:

{

  dconf.settings = {
    "org/gnome/shell" = {
      favorite-apps =
        [ "firefox.desktop" "kitty.desktop" "org.telegram.desktop.desktop" ];
    };
  };
}
