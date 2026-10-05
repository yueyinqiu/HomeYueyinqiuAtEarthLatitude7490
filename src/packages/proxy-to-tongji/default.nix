{ config, pkgs, ... }:
let
  socksPort = 56509;
  easytierConfig = pkgs.replaceVars ./easytier-config.toml {
    socksPort = toString socksPort;
  };
  configuration = pkgs.linkFarm "proxy-to-tongji-config" [
    {
      name = "config.sh.example";
      path = (pkgs.replaceVars ./config/config.sh.example {
        socksPort = toString socksPort;
      });
    }
    {
      name = "easytier.env.example";
      path = ./config/easytier.env.example;
    }
  ];
in
{
  home-manager-mihomo-manager.instances.to-tongji = {
    port = 11410;
    configuration = configuration;
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
      ExecStart = "${pkgs.easytier}/bin/easytier-core -c ${easytierConfig}";
      Restart = "on-failure";
    };
  };
}
