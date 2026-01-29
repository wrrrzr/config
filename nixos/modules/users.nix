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
  mkUserFunc =
    connectable: username:
    lib.optionalAttrs cfg.users.${username}.enable {
      ${username} = {
        isNormalUser = true;
        extraGroups = [
          "wheel"
        ];
        openssh.authorizedKeys.keys = lib.mkIf connectable [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFkbZDukqSo/lPT5tHl1cUR4SXs3aUmJ+C7YTQ3ztCf1"
        ];
        hashedPasswordFile = "/etc/secret/passwd/${username}";
      };
    };
  mkConnectableUser = mkUserFunc true;
  mkUser = mkUserFunc false;
in
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];
  options.module.users = {
    enable = lib.mkEnableOption "Users configuration";
    users = {
      me.enable = lib.mkEnableOption "User me";
      utopiya.enable = lib.mkEnableOption "User utopiya";
      tux.enable = lib.mkEnableOption "User tux";
      wisdom.enable = lib.mkEnableOption "User wisdom";
    };
  };
  config = lib.mkIf cfg.enable {
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      extraSpecialArgs = { inherit system inputs stateVersion; };
    };

    home-manager.users = { } // mkHomeManager "me" // mkHomeManager "utopiya" // mkHomeManager "wisdom";
    users.users = { } // mkUser "me" // mkUser "utopiya" // mkUser "wisdom" // mkConnectableUser "tux";
  };
}
