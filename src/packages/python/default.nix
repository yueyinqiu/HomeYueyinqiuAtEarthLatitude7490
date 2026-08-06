{ pkgs, ... }: {
  home.packages = with pkgs; [
    python314
  ];

  imports = [
    ./cheats
  ];

  my.navi-cheats.python = ''
    # run python, a versatile and easy-to-learn language that lets you work quickly and integrate systems more effectively.
    python <args>
  '';
}
