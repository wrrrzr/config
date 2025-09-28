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
      utopiya = {
        enable = lib.mkEnableOption "User utopiya";
      };
    };
  };
  config = lib.mkIf cfg.enable {
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      extraSpecialArgs = { inherit system inputs stateVersion; };
    };

    home-manager.users =
      { }
      // lib.optionalAttrs cfg.users.me.enable { me = ../../home/me; }
      // lib.optionalAttrs cfg.users.utopiya.enable { utopiya = ../../home/utopiya; };
    users.users =
      { }
      // lib.optionalAttrs cfg.users.me.enable {
        me = {
          isNormalUser = true;
          extraGroups = [
            "wheel"
          ];
          hashedPasswordFile = "/etc/secret/passwd/me";
        };
      }
      // lib.optionalAttrs cfg.users.utopiya.enable {
        utopiya = {
          isNormalUser = true;
          extraGroups = [ "wheel" ];
          hashedPasswordFile = "/etc/secret/passwd/utopiya";
        };
      };
  };
}
