{ ... }: {
  config = {
    programs.navi.enable = true;
    programs.navi.enableBashIntegration = true;
    programs.navi.settings = {
      finder = {
        overrides_var = "--no-select-1 --bind alt-enter:replace-query";
      };
    };
  };
}
