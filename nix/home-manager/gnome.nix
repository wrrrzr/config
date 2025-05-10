{ config, pkgs, ... }:

{

  dconf.settings = {
    "org/gnome/shell" = {
      favorite-apps =
        [ "firefox.desktop" "kitty.desktop" "org.telegram.desktop.desktop" ];
    };
    "org/gnome/desktop/wm/keybindings" = {
      switch-to-workspace-1 = [ "<Alt>1" ];
      switch-to-workspace-2 = [ "<Alt>2" ];
      switch-to-workspace-3 = [ "<Alt>3" ];
      switch-to-workspace-4 = [ "<Alt>4" ];
      switch-to-workspace-5 = [ "<Alt>5" ];
      switch-to-workspace-6 = [ "<Alt>6" ];
      switch-to-workspace-7 = [ "<Alt>7" ];
      switch-to-workspace-8 = [ "<Alt>8" ];
      switch-to-workspace-9 = [ "<Alt>9" ];
    };
    "org/gnome/desktop/interface" = { color-scheme = "prefer-dark"; };
  };
}
