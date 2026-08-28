{...}: {
  imports = [
    ./csharp
    ./nix
  ];

  programs.nvf.settings.vim = {
    opts.expandtab = true;
    opts.tabstop = 4;
    opts.shiftwidth = 4;

    languages = {
      enableFormat = true;
      enableTreesitter = true;
      # Disables extra linters like statix (often noisy for Nix).
      enableExtraDiagnostics = false;

      markdown.enable = true;

      bash.enable = true;
      json.enable = true;
      python.enable = true;
      toml.enable = true;
      xml.enable = true;
      env.enable = true;
    };
  };
}
