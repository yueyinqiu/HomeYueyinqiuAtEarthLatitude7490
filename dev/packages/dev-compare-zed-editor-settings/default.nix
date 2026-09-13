{ name, pkgs, ... }:

pkgs.writeShellApplication {
  name = name;
  text = ''
    exec ${pkgs.dotnetCorePackages.sdk_10_0}/bin/dotnet run ${./diff-settings.cs}
  '';
}
