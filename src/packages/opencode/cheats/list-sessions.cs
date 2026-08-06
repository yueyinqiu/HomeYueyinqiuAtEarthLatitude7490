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
        var output = await Cli.Wrap("opencode")
            .WithArguments(["session", "list"])
            .ExecuteBufferedAsync(cancellationToken);
        foreach (var line in output.StandardOutput.Split(
            Environment.NewLine,
            StringSplitOptions.RemoveEmptyEntries))
        {
            var session = line.Trim().Split(' ', '\t')[0];
            if (session.StartsWith("ses_"))
            {
                yield return (session, "");
            }
        }
    }
}
