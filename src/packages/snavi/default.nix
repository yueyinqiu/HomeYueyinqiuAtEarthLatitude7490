{
  pkgs,
  nur,
  ...
}:
{
  home.packages = [
    pkgs.fzf
    nur.yueyinqiu.snavi
  ];
}
