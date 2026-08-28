{...}: {
  programs.nvf.settings.vim.autocmds = [
    {
      enable = true;
      event = ["FileType"];
      pattern = ["nix"];
      command = "setlocal tabstop=2 shiftwidth=2";
    }
  ];

  programs.nvf.settings.vim.languages.nix = {
    enable = true;
    lsp.servers = ["nixd"];
  };
}
