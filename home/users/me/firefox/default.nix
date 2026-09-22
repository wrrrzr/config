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
          vimium
          redirector
        ];
        id = 0;
      };
      proxy = {
        extensions.packages = with ff; [
          multi-account-containers
          vimium
          youtube-shorts-block
        ];
        id = 1;
      };
      r = {
        extensions.packages = with ff; [
          multi-account-containers
          violentmonkey
        ];
        id = 2;
      };
    };
    policies = {
      AppAutoUpdate = false;
      BackgroundAppUpdate = false;
      DisableAccounts = true;
      DisableFirefoxAccounts = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DisplayBookmarksToolbar = "never";
      DisplayMenuBar = "default-off";
      DontCheckDefaultBrowser = true;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
      OverrideFirstRunPage = "";
      OverridePostUpdatePage = "";
      SearchBar = "unified";
    };
  };
}
