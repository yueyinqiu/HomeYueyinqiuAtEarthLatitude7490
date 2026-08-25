{ nvf, ... }: {
  imports = [
    nvf.homeManagerModules.default
  ];

  programs.nvf.enable = true;
  programs.nvf.settings = {
  };
}
