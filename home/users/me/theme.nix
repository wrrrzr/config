{ pkgs, ... }:

{
  home.pointerCursor = {
    package = pkgs.adwaita-icon-theme;
    name = "Adwaita";
    size = 14;
  };

  gtk = {
    enable = true;
    gtk4.theme = null;
    theme = {
      package = pkgs.dracula-theme;
      name = "Dracula";
    };
    iconTheme = {
      package = pkgs.elementary-xfce-icon-theme;
      name = "elementary-xfce";
    };
  };

  dconf.settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";
}
