{ ... }: {
  imports = [
    ./cheats.nix
  ];

  programs.pi-coding-agent = {
    enable = true;

    settings = {
      defaultProvider = "35-220-164-252-3888";
      defaultModel = "deepseek-v4-pro";
      defaultThinkingLevel = "low";
    };

    models = {
      providers = {
        "35-220-164-252-3888" = {
          baseUrl = "https://api.boyuerichdata.opensphereai.com/v1";
          api = "openai-completions";
          compat = {
            supportsDeveloperRole = false;
          };
          models = [
            {
              id = "deepseek-v4-pro";
              name = "deepseek-v4-pro";
              contextWindow = 900000;
              maxTokens = 384000;
              reasoning = true;
              input = [ "text" ];
            }
          ];
        };
      };
    };
  };
}
