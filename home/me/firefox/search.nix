{
  ...
}:

{
  programs.firefox = {
    profiles.me = {
      search.default = "ddg";
      search.force = true;
      search.engines = {
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
        "Ru to En" = {
          urls = [
            {
              template = "https://translate.google.com";
              params = [
                {
                  name = "hl";
                  value = "en";
                }
                {
                  name = "sl";
                  value = "ru";
                }
                {
                  name = "tl";
                  value = "en";
                }
                {
                  name = "text";
                  value = "{searchTerms}";
                }
                {
                  name = "op";
                  value = "translate";
                }
              ];
            }
          ];
          definedAliases = [
            "@translate"
            "@gt"
          ];
        };
      };
    };
  };
}
