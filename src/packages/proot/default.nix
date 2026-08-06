{ pkgs, ... }: {
  home.packages = with pkgs; [
    proot
  ];

  imports = [
    ./cheats
  ];

  my.navi-cheats.proot = ''
    # run proot, a user-space implementation of chroot, mount --bind, and binfmt_misc.
    proot <args>
  '';
}