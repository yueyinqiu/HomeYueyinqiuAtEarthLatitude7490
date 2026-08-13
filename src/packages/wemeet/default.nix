{ ... }: {
  services.flatpak.packages = [
    "flathub:app/com.tencent.wemeet/x86_64/stable"
  ];

  imports = [
    ./cheats
  ];
}
