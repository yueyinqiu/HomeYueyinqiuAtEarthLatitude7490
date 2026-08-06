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
        var psi = new ProcessStartInfo("opencode")
        {
            UseShellExecute = false,
            RedirectStandardOutput = true,
            RedirectStandardError = true,
        };
        psi.ArgumentList.Add("session");
        psi.ArgumentList.Add("list");
        using var process = Process.Start(psi)!;
        var stdout = process.StandardOutput.ReadToEnd();
        process.WaitForExit();
        foreach (var line in stdout.Split('\n', StringSplitOptions.RemoveEmptyEntries))
        {
            var session = line.Trim().Split(' ', '\t')[0];
            if (session.StartsWith("ses_"))
            {
                yield return (session, "");
            }
        }
    }
}
