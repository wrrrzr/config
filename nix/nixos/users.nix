{ config, lib, pkgs, ... }:

{
  users.users.me = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "libvirtd" ];
  };
}
