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
        var psi = new ProcessStartInfo("nb")
        {
            UseShellExecute = false,
            RedirectStandardOutput = true,
            RedirectStandardError = true,
        };
        psi.ArgumentList.Add("list");
        psi.ArgumentList.Add("--filenames");
        psi.ArgumentList.Add("--no-id");
        using var process = Process.Start(psi)!;
        var stdout = process.StandardOutput.ReadToEnd();
        process.WaitForExit();
        foreach (var line in stdout.Split('\n', StringSplitOptions.RemoveEmptyEntries))
        {
            yield return (line.Trim(), "");
        }
    }
}
