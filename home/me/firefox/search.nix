{
  pkgs,
  ...
}:

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
          icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
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
          icon = pkgs.fetchurl {
            url = "https://mwmbl.org/static/images/logo.svg";
            sha256 = "YqhPROWFxaZs+YXmXsUaEt8/fzx+VUJLb4tRc9qik0s=";
          };
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
          icon = pkgs.fetchurl {
            url = "https://github.com/favicon.ico";
            sha256 = "LuQyN9GWEAIQ8Xhue3O1fNFA9gE8Byxw29/9npvGlfg=";
          };
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
      };
    };
  };
}
