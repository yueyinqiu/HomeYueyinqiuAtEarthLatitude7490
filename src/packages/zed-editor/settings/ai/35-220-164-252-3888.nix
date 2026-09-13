{ ... }:
{
  programs.zed-editor.userSettings.language_models.openai_compatible."35-220-164-252-3888" = {
    api_url = "https://api.boyuerichdata.opensphereai.com/v1";
    available_models = [
      {
        name = "deepseek-v4-pro";
        max_tokens = 200000;
        max_output_tokens = 32000;
        max_completion_tokens = 200000;
        reasoning_effort = "low";
        capabilities = {
          tools = true;
          images = false;
          parallel_tool_calls = false;
          prompt_cache_key = true;
          chat_completions = true;
          interleaved_reasoning = false;
          max_tokens_parameter = false;
        };
      }
    ];
  };
}
