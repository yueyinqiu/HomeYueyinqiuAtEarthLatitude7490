#:package Snavi.ArgumentSuggester@0.0.2

using System.Runtime.CompilerServices;
using Snavi.ArgumentSuggester;

await new Suggester().RunAsync();

class Suggester : SnaviArgumentSuggester
{
    private static readonly string[] ArchiveExtensions =
        [".zip", ".tar", ".tgz", ".gz", ".7z", ".rar", ".zst", ".bz2", ".xz"];

    public override async IAsyncEnumerable<(string Value, string Description)> SuggestAsync(
        IReadOnlyList<string> givenArguments,
        DirectoryInfo currentDirectory,
        DirectoryInfo temporaryDirectory,
        [EnumeratorCancellation] CancellationToken cancellationToken
    )
    {
        foreach (var file in currentDirectory.EnumerateFiles())
        {
            if (ArchiveExtensions.Any(extension => file.Name.EndsWith(extension, StringComparison.OrdinalIgnoreCase)))
            {
                yield return (file.Name, "");
            }
        }
    }
}
