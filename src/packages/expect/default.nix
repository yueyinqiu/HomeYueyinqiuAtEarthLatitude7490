{ pkgs, ... }: {
  home.packages = with pkgs; [
    expect

    (pkgs.writeShellApplication {
      name = "my-expect-bash-run";
      text = ''
        escaped="''${*@Q}"
        expect "${./bash-run.exp}" -- "$escaped"
      '';
    })
  ];

  imports = [
    ./cheats
  ];
}
