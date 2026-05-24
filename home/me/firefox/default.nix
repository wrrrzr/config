{
  config,
  inputs,
  system,
  pkgs,
  lib,
  ...
}:

let
  ff = inputs.firefox-addons.packages.${system};
  mkFirefoxPkg =
    profile:
    (pkgs.writeScriptBin "firefox-${profile}" ''
      ${lib.getExe pkgs.firefox} -P ${profile}
    '');
in
{
  imports = [ ./search.nix ];

  home.packages = [
    (mkFirefoxPkg "me")
    (mkFirefoxPkg "proxy")
    (mkFirefoxPkg "r")
  ];

  programs.firefox = {
    enable = true;
    configPath = "${config.xdg.configHome}/mozilla/firefox";
    profiles = {
      me = {
        extensions.packages = with ff; [
          multi-account-containers
          darkreader
          vimium
        ];
        id = 0;
      };
      proxy = {
        extensions.packages = with ff; [
          multi-account-containers
          darkreader
          vimium
        ];
        id = 1;
      };
      r = {
        extensions.packages = with ff; [
          multi-account-containers
        ];
        id = 2;
      };
    };
    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
      DisablePocket = true;
      DisableFirefoxAccounts = true;
      DisableAccounts = true;
      DisableFirefoxScreenshots = true;
      OverrideFirstRunPage = "";
      OverridePostUpdatePage = "";
      DontCheckDefaultBrowser = true;
      DisplayBookmarksToolbar = "never";
      DisplayMenuBar = "default-off";
      SearchBar = "unified";
    };
  };
}
