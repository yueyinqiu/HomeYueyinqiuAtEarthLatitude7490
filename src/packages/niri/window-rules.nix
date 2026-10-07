# Custom window rules. niri's built-in default rules (wezterm, firefox
# picture-in-picture) come from `enableDefaultConfig`; only our additions go here.
[
  {
    "window-rule" = {
      match = { _props = { "app-id" = "com.mitchellh.ghostty"; }; };
      "open-maximized-to-edges" = true;
    };
  }
  {
    "window-rule" = {
      match = { _props = { "app-id" = "wpsoffice"; }; };
      "open-fullscreen" = false;
      "open-maximized-to-edges" = true;
    };
  }
  {
    "window-rule" = {
      match = { _props = { "app-id" = "code"; }; };
      "open-maximized-to-edges" = true;
    };
  }
]
