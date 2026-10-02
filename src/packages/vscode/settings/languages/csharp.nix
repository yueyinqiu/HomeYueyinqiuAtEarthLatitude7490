{ pkgs, ... }:
{
  programs.vscode.profiles.default.userSettings = {
    "dotnet.server.path" = "${pkgs.roslyn-ls}/bin/Microsoft.CodeAnalysis.LanguageServer";
    "dotnetAcquisitionExtension.existingDotnetPath" = "${pkgs.dotnetCorePackages.sdk_10_0}/bin/dotnet";
  };
}
