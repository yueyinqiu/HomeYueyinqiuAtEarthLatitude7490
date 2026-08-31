{...}: {
  programs.nvf.settings.vim = {
    languages.python.enable = true;
    diagnostics.nvim-lint.linters_by_ft.python = ["flake8"];
  };
}
