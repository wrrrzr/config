{
  pkgs,
  consts,
  lib,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    disko
  ];
  users.users = {
    root.hashedPasswordFile = lib.mkForce null;
    installer = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
      openssh.authorizedKeys.keys = [ consts.pubkeys.installerkey ];
    };
  };
  security.sudo.wheelNeedsPassword = false;
  networking.firewall.enable = false;
}
