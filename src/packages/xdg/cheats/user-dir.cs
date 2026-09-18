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
        yield return ("DESKTOP", "");
        yield return ("DOWNLOAD", "");
        yield return ("TEMPLATES", "");
        yield return ("PUBLICSHARE", "");
        yield return ("DOCUMENTS", "");
        yield return ("MUSIC", "");
        yield return ("PICTURES", "");
        yield return ("VIDEOS", "");
    }
}
