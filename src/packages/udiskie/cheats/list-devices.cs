#:package Snavi.ArgumentSuggester@0.0.2

using System.Diagnostics;
using System.Runtime.CompilerServices;
using Snavi.ArgumentSuggester;

await new Suggester().RunAsync();

class Suggester : SnaviArgumentSuggester
{
    public override async IAsyncEnumerable<(string Value, string Description)> SuggestAsync(
        IReadOnlyList<string> givenArguments,
        DirectoryInfo currentDirectory,
        DirectoryInfo temporaryDirectory,
        [EnumeratorCancellation] CancellationToken cancellationToken
    )
    {
        var psi = new ProcessStartInfo("lsblk")
        {
            UseShellExecute = false,
            RedirectStandardOutput = true,
            RedirectStandardError = true,
        };
        psi.ArgumentList.Add("-l");
        psi.ArgumentList.Add("-n");
        psi.ArgumentList.Add("-o");
        psi.ArgumentList.Add("NAME");
        using var process = Process.Start(psi)!;
        var stdout = process.StandardOutput.ReadToEnd();
        process.WaitForExit();
        foreach (var line in stdout.Split('\n', StringSplitOptions.RemoveEmptyEntries))
        {
            yield return (line.Trim(), "");
        }
    }
}
