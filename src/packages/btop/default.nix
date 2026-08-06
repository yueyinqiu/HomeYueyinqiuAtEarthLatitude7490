{ pkgs, ... }: {
  home.packages = with pkgs; [
    btop
  ];
  imports = [
    ./cheats
  ];

  my.navi-cheats.btop = ''
    # run btop, a resource monitor that shows usage and stats for processor, memory, disks, network and processes.
    btop
  '';
}
