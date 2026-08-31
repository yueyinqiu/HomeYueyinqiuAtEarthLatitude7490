{pkgs, ...}: {
  home.packages = with pkgs; [
    opencode
  ];
  xdg.configFile."opencode/opencode.jsonc".source = ./opencode.jsonc;
  xdg.configFile."opencode/plugin/remove_max_tokens.ts".source = ./remove_max_tokens.ts;

  imports = [
    ./cheats
  ];
}
