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
        var configHome = Environment.GetEnvironmentVariable("XDG_CONFIG_HOME")
            ?? Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.UserProfile), ".config");
        var proxiesDir = Path.Combine(configHome, "proxies");
        if (Directory.Exists(proxiesDir))
        {
            foreach (var dir in new DirectoryInfo(proxiesDir).EnumerateDirectories())
            {
                yield return (dir.Name, "");
            }
        }
    }
}
