{ config, ... }: {
  services.udiskie.enable = true;
  home.file."udiskie".source = config.lib.file.mkOutOfStoreSymlink "/run/media/yueyinqiu";

  imports = [
    ./cheats
  ];

  my.navi-cheats.udiskie = ''
    $ device: lsblk -l -n -o NAME --- --map my-bash-escape-std

    # unmount a disk partition
    udisksctl unmount -b <device>

    # power off a disk device
    udisksctl power-off -b <device>
  '';
}
