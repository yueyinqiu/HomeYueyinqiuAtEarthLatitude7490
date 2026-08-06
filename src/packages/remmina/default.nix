{ pkgs, ... }: {
  home.packages = with pkgs; [
    remmina
  ];

  imports = [
    ./cheats
  ];

  my.navi-cheats.remmina = ''
    # run remmina, an X2Go, RDP, SSH, SPICE, VNC, and X2Go protocol remote desktop client.
    remmina
  '';
}
