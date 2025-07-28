{ config, lib, pkgs, ... }:

let
  myvim = (pkgs.vim-full.customize {
    vimrcConfig.customRC = ''
      set mouse=
    '';
  });
in {
  environment.systemPackages = with pkgs; [
    myvim
    wget
    home-manager
    htop
    neofetch
    gettext
    tree
    lm_sensors
    smartmontools
    git
  ];
}
