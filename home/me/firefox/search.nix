{
  ...
}:

let
  icons = {
    nixPackages = ./icons/nix-packages.svg;
    mwmbl = ./icons/mwmbl.svg;
    github = ./icons/github.ico;
    youtube = ./icons/youtube.ico;
  };
in
{
  programs.firefox = {
    profiles.me = {
      search.force = true;
      search.engines = {
        "Nix Packages" = {
          urls = [
            {
              template = "https://search.nixos.org/packages";
              params = [
                {
                  name = "type";
                  value = "packages";
                }
                {
                  name = "query";
                  value = "{searchTerms}";
                }
              ];
            }
          ];
          icon = icons.nixPackages;
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
          icon = icons.mwmbl;
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
          icon = icons.github;
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
          icon = icons.youtube;
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
