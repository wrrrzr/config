{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim
    wget
    home-manager
    htop
    neofetch
    gettext
    tree
    lm_sensors
    smartmontools
  ];
}
