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
  mkHomeManager =
    username:
    lib.optionalAttrs cfg.users.${username}.enable {
      ${username} =
        { ... }:
        {
          imports = [
            ../../home/${username}
            ../../home/modules
          ];
        };
    };
  mkUser =
    username:
    lib.optionalAttrs cfg.users.${username}.enable {
      ${username} = {
        isNormalUser = true;
        extraGroups = [
          "wheel"
        ];
        hashedPasswordFile = "/etc/secret/passwd/${username}";
      };
    };
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

    home-manager.users = { } // mkHomeManager "me" // mkHomeManager "utopiya";
    users.users = { } // mkUser "me" // mkUser "utopiya";
  };
}
