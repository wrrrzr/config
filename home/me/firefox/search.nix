{
  ...
}:

let
  search = {
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
          {
            template = "https://www.google.com/complete/search";
            params = [
              {
                name = "client";
                value = "chrome";
              }
              {
                name = "ds";
                value = "yt";
              }
              {
                name = "q";
                value = "{searchTerms}";
              }
            ];
            type = "application/x-suggestions+json";
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
in
{
  programs.firefox.profiles = {
    me.search = search;
    proxy.search = search;
    r.search = search;
  };
}
