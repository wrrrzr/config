{
  ...
}:

{
  programs.firefox.profiles.me.search = {
    default = "google";
    force = true;
    engines = {
      "Nix Packages" = {
        urls = [
          {
            template = "https://search.nixos.org/packages";
            params = [
              {
                name = "channel";
                value = "unstable";
              }
              {
                name = "query";
                value = "{searchTerms}";
              }
            ];
          }
        ];
        definedAliases = [
          "@nixpkgs"
          "@nix"
        ];
      };
      "Mwmbl" = {
        urls = [
          {
            template = "https://mwmbl.org/";
            params = [
              {
                name = "q";
                value = "{searchTerms}";
              }
            ];
          }
        ];
        definedAliases = [
          "@mwmbl"
          "@mw"
        ];
      };
      "Github" = {
        urls = [
          {
            template = "https://github.com/search";
            params = [
              {
                name = "q";
                value = "{searchTerms}";
              }
              {
                name = "type";
                value = "code";
              }
            ];
          }
        ];
        definedAliases = [
          "@github"
          "@gh"
        ];
      };
      "Youtube" = {
        urls = [
          {
            template = "https://youtube.com/results";
            params = [
              {
                name = "search_query";
                value = "{searchTerms}";
              }
            ];
          }
        ];
        definedAliases = [
          "@youtube"
          "@yt"
        ];
      };
      "Noogle" = {
        urls = [
          {
            template = "https://noogle.dev/q";
            params = [
              {
                name = "term";
                value = "{searchTerms}";
              }
            ];
          }
        ];
        definedAliases = [
          "@noogle"
        ];
      };
      "Absurdopedia" = {
        urls = [
          {
            template = "https://absurdopedia.net/w/index.php";
            params = [
              {
                name = "search";
                value = "{searchTerms}";
              }
            ];
          }
        ];
        definedAliases = [
          "@absurdopedia"
        ];
      };
    };
  };
}
