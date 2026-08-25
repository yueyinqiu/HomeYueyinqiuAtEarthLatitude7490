{ pkgs, nvf, ... }: {
  # imports = [
  #   nvf.homeManagerModules.default
  # ];
# 
  # programs.nvf.enable = true;
  # programs.nvf.settings = {
  #   vim = {
  #     # Core dev experience (picked from your answers)
  #     lsp = {
  #       enable = true;
  #       formatOnSave = true;
  #     };
# 
  #     autocomplete = {
  #       nvim-cmp.enable = true;
  #     };
# 
  #     debugger = {
  #       nvim-dap = {
  #         enable = true;
  #         ui.enable = true;
  #       };
  #     };
# 
  #     terminal = {
  #       toggleterm = {
  #         enable = true;
  #         lazygit.enable = true;
  #       };
  #     };
# 
  #     binds = {
  #       whichKey.enable = true;
  #       cheatsheet.enable = true;
  #     };
# 
  #     filetree.neo-tree = {
  #       enable = true;
  #       setupOpts.enable_cursor_hijack = true;
  #     };
# 
  #     keymaps = [
  #       {
  #         key = "<C-n>";
  #         mode = "n";
  #         silent = true;
  #         action = ":Neotree filesystem reveal left<CR>";
  #       }
  #     ];
# 
  #     # Fuzzy finding
  #     startPlugins = with pkgs.vimPlugins; [
  #       telescope-ui-select-nvim
  #     ];
  #     telescope = {
  #       enable = true;
  #       setupOpts.extensions."ui-select" = {
  #         # keep defaults
  #       };
  #     };
  #     luaConfigRC.telescope-ui-select = ''
  #       require("telescope").load_extension("ui-select")
  #     '';
# 
  #     # Language support
  #     languages = {
  #       enableFormat = true;
  #       enableTreesitter = true;
# 
  #       nix = {
  #         enable = true;
  #         lsp.servers = [ "nixd" ];
  #       };
# 
  #       python.enable = true;
  #       lua.enable = true;
# 
  #       csharp = {
  #         enable = true;
  #         # Use Roslyn LSP (roslyn-ls) + roslyn-nvim integration.
  #         lsp.servers = [ "roslyn-ls" ];
  #         extensions.roslyn-nvim.enable = true;
  #       };
  #     };
  #   };
  # };
}
