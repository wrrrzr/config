{ config, lib, ... }:

{
  config = lib.mkIf config.module.nixvim.enable {
    programs.nixvim.plugins = {
      codecompanion = {
        enable = true;

        settings = {
          adapters = {
            openrouter = {
              __raw = ''
                function()
                  return require("codecompanion.adapters").extend("openai_compatible", {
                      env = {
                          url       = "https://openrouter.ai/api",
                          api_key   = "OPENROUTER_API_KEY",
                          chat_url  = "/v1/chat/completions",
                      },
                      schema = {
                          model = {
                              default = "mistralai/mistral-small-3.2-24b-instruct:free",
                          },
                      },
                  })
                end
              '';
            };
          };

          strategies = {
            agent = {
              adapter = "openrouter";
            };
            chat = {
              adapter = "openrouter";
            };
            inline = {
              adapter = "openrouter";
            };
          };
        };
      };
    };
  };
}
