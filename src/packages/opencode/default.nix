{ pkgs, ... }: {
  home.packages = with pkgs; [
    opencode
  ];
  xdg.configFile."opencode/opencode.jsonc".source = ./opencode.jsonc;

  imports = [
    ./cheats
  ];
}
