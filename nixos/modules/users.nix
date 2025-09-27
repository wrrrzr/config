{
  system,
  inputs,
  stateVersion,
  config,
  lib,
  ...
}:

let
  cfg = config.module.users;
in
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];
  options.module.users = {
    enable = lib.mkEnableOption "Users configuration";
    users = {
      me = {
        enable = lib.mkEnableOption "User me";
      };
    };
  };
  config = lib.mkIf cfg.enable {
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      extraSpecialArgs = { inherit system inputs stateVersion; };
    };

    home-manager.users = lib.mkIf cfg.users.me.enable { me = ../../home/me; };
    users.users = lib.mkIf cfg.users.me.enable {
      me = {
        isNormalUser = true;
        extraGroups = [
          "wheel"
        ];
        hashedPasswordFile = "/etc/secret/passwd/me";
      };
    };
  };
}
