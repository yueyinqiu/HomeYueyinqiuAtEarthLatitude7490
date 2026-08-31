{...}: {
  imports = [
    ./csharp
    ./nix
    ./python
  ];

  programs.nvf.settings.vim = {
    opts.expandtab = true;
    opts.tabstop = 4;
    opts.shiftwidth = 4;

    languages = {
      enableFormat = false;
      enableTreesitter = true;

      markdown.enable = true;

      bash.enable = true;
      json.enable = true;
      toml.enable = true;
      xml.enable = true;
      env.enable = true;
    };
  };
}
