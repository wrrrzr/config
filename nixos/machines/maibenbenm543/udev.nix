{ pkgs, lib, ... }:

{
  services.udev.packages =
    let
      udevRule =
        name: text:
        pkgs.writeTextFile {
          inherit name text;
          destination = "/etc/udev/rules.d/${name}.rules";
        };
    in
    lib.mapAttrsToList udevRule {
      "72-remove-access-permissions" = ''
        KERNEL=="video[0-9]*", MODE="0600", TAG-="uaccess"
      '';
    };
}
