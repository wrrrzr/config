{
  system,
  inputs,
  stateVersion,
  config,
  consts,
  lib,
  ...
}:

let
  cfg = config.module.users;
  mkPasswdFile = username: "/etc/secret/passwd/${username}";
  mkHomeManager =
    username:
    lib.optionalAttrs cfg.users.${username}.enable {
      ${username} =
        { ... }:
        {
          imports = [
            ../../home/users/${username}
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
        ]
        ++ cfg.extraGroups;
        openssh.authorizedKeys.keys = lib.mkIf connectable [ consts.pubkeys.sshkey ];
        hashedPasswordFile = mkPasswdFile username;
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
    enable = lib.mkEnableOption "Users configuration" // {
      default = true;
    };
    home-manager = lib.mkEnableOption "Home manager";
    extraGroups = lib.mkOption {
      type = with lib.types; listOf str;
      default = [ ];
      example = [ "samba" ];
      description = "Extra groups for all defined users";
    };
    users = {
      me.enable = lib.mkEnableOption "User me";
      utopiya.enable = lib.mkEnableOption "User utopiya";
      tux.enable = lib.mkEnableOption "User tux";
      wisdom.enable = lib.mkEnableOption "User wisdom";
    };
  };
  config = lib.mkIf cfg.enable {
    home-manager = lib.mkIf cfg.home-manager {
      useGlobalPkgs = true;
      useUserPackages = true;
      backupFileExtension = "bak";
      extraSpecialArgs = {
        inherit
          system
          inputs
          stateVersion
          consts
          ;
      };
      users = { } // mkHomeManager "me" // mkHomeManager "utopiya" // mkHomeManager "wisdom";
    };

    users = {
      mutableUsers = false;
      users =
        { }
        // mkUser "me"
        // mkUser "utopiya"
        // mkUser "wisdom"
        // mkConnectableUser "tux"
        // {
          root.hashedPasswordFile = mkPasswdFile "root";
        };
    };
  };
}
