{ pkgs, ... }: {
  programs.bash.enable = true;

  home.packages = [
    (pkgs.writeShellApplication {
      name = "my-bash-escape-std";
      text = ''
        input=$(cat)
        printf "%s" "''${input@Q}"
      '';
    })
  ];

  imports = [
    ./cheats
  ];
}
