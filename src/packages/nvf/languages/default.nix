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
      enableExtraDiagnostics = true;

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
