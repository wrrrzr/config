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
    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/kitty/"
      ];
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/kitty" = {
      name = "kitty";
      command = "kitty";
      binding = "<Alt><Shift>Return";
    };
    "org/gnome/desktop/interface" = { color-scheme = "prefer-dark"; };
    "org/gnome/desktop/peripherals/touchpad" = {
      disable-while-typing = false;
    };
  };
}
