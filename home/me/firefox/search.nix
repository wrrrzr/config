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
          definedAliases = [ "@nixpkgs" ];
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
          definedAliases = [ "@mwmbl" ];
        };
      };
    };
  };
}
