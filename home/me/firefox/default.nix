{
  firefox-addons,
  system,
  ...
}:

{
  imports = [ ./search.nix ];

  programs.firefox = {
    enable = true;
    profiles.me = {
      extensions.packages = with firefox-addons.packages.${system}; [
        multi-account-containers
        darkreader
        vimium
      ];
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
