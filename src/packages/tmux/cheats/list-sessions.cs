#:package Snavi.ArgumentSuggester@0.0.2
#:package CliWrap@3.10.4

using System.Runtime.CompilerServices;
using CliWrap;
using CliWrap.Buffered;
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
        var output = await Cli.Wrap("tmux")
            .WithArguments(["list-sessions", "-F", "#{session_name}:#{session_windows}"])
            .ExecuteBufferedAsync(cancellationToken);
        foreach (var line in output.StandardOutput.Split('\n', StringSplitOptions.RemoveEmptyEntries))
        {
            var name = line;
            var description = "";
            var colon = line.LastIndexOf(':');
            if (colon >= 0)
            {
                name = line[..colon];
                description = line[(colon + 1)..] + " windows";
            }
            yield return (name, description);
        }
    }
}
