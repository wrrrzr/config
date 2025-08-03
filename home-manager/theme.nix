{ config, pkgs, ... }:

{
  home.pointerCursor = {
    package = pkgs.adwaita-icon-theme;
    name = "Adwaita";
    size = 14;
  };

  gtk = {
    enable = true;
    theme = {
      package = pkgs.dracula-theme;
      name = "Dracula";
    };
  };

  xdg.configFile."gtk-4.0/settings.ini".source = ./gtk4-settings.ini;
  xdg.configFile."gtk-4.0/gtk.css".source = ./gtk4-gtk.css;
}
