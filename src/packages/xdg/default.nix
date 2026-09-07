{ config,... }: 
let
  base = "${config.home.homeDirectory}/.xdg";
in
{
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    desktop = "${base}/Desktop";
    documents = "${base}/Documents";
    download = "${base}/Downloads";
    music = "${base}/Music";
    pictures = "${base}/Pictures";
    projects = "${base}/Projects";
    publicShare = "${base}/Public";
    templates = "${base}/Templates";
    videos = "${base}/Videos";
  };
}
