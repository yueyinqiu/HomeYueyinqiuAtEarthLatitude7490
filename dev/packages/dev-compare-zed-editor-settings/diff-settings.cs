#:package CliWrap@3.10.5
#:package Ivy.SystemTextJson.JsonDiffPatch@2.0.4

using CliWrap;
using CliWrap.Buffered;
using System.Text.Json;
using System.Text.Json.JsonDiffPatch;
using System.Text.Json.JsonDiffPatch.Diffs.Formatters;
using System.Text.Json.Nodes;

var zed = JsonNode.Parse(File.ReadAllText(
    Path.Combine(
        Environment.GetFolderPath(
            Environment.SpecialFolder.ApplicationData
        ), "zed", "settings.json"
    )
));

var nixResult = await Cli.Wrap("nix")
    .WithArguments([
        "eval", "--json", ".#homeConfigurations.\"yueyinqiu@earth-latitude7490\".config.programs.zed-editor.userSettings"
    ])
    .ExecuteBufferedAsync();
var nix = JsonNode.Parse(nixResult.StandardOutput);

Console.WriteLine(
    zed.Diff(
        nix,
        new JsonPatchDeltaFormatter()
    )?.ToJsonString(
        new JsonSerializerOptions { WriteIndented = true }
    )
);
