#:package Snavi.ArgumentSuggester@0.0.2

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
        var proxies = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData), "proxies");
        foreach (var directory in new DirectoryInfo(proxies).EnumerateDirectories())
        {
            yield return (directory.Name, "");
        }
    }
}
