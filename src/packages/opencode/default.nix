{ pkgs, ... }: {
  home.packages = with pkgs; [
    opencode
  ];

  imports = [
    ./cheats
  ];

  my.navi-cheats.opencode = ''
    $ session: opencode session list | grep '^ses_' --- --column 1 --map my-bash-escape-std

    # start a new opencode interactive session
    opencode

    # resume a specific opencode session
    opencode -s <session>
  '';
}
