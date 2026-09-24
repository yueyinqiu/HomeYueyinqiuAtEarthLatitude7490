{
  config,
  ...
}:
{
  imports = [
    ./cheats.nix
  ];

  programs.snavi.enable = true;

  programs.bash.initExtra = ''
    s() {
      local result="$(${config.programs.snavi.wrapperName})"
      echo "$result"
      history -s -- "$result"
      echo "Saved to history."
    }
  '';
}
