{ config, pkgs, ... }:
{
  home-manager-mihomo-manager.instances.to-tongji = {
    port = 11410;
    configuration = ./config;
  };

  systemd.user.services.easytier-tongji = {
    Unit = {
      Description = "EasyTier network for Tongji proxy";
      After = [ "network-online.target" ];
      Wants = [ "network-online.target" ];
    };
    Install = {
      WantedBy = [ "default.target" ];
    };
    Service = {
      EnvironmentFile = "${config.xdg.configHome}/home-manager-mihomo-manager/to-tongji/easytier.env";
      ExecStart = "${pkgs.easytier}/bin/easytier-core -c ${./easytier-config.toml}";
      Restart = "on-failure";
    };
  };
}
