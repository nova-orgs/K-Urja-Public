# Pure PowerShell: commits + insertions + deletions per author
<#
.SYNOPSIS
    Generates Git contribution statistics (commits, insertions, deletions) per author.
    It supports merging stats for authors who use different names via an alias map.
#>

# --- Configuration Section ---

# Define a mapping of author aliases to their canonical (merged) name.
# Format: @{ "Alias Name 1" = "Canonical Name"; "Alias Name 2" = "Canonical Name" }
# In your case, we map both names to 'Anukheth Sunil M' for merging.
$AuthorAliases = @{
    "kethu-x86" = "Anukheth Sunil M";
    # Add other aliases here if needed: "Another Alias" = "Canonical Name";
}

# --- Script Logic ---

# Get unique list of authors from the git log
$rawAuthors = git log --format="%aN" | Sort-Object | Get-Unique

# Initialize the main results hashtable
$StatsByAuthor = @{}

Write-Host "Git Contribution Statistics (Alias Merged)" -ForegroundColor Cyan
Write-Host "---------------------------------------------------"

# 1. Process all raw authors and aggregate stats
foreach ($author in $rawAuthors) {

    # Determine the canonical name for this author
    # If the author is in the alias list, use the canonical name; otherwise, use the author's name itself
    $canonicalAuthor = if ($AuthorAliases.ContainsKey($author)) {
        $AuthorAliases[$author]
    } else {
        $author
    }

    # Initialize stats for the canonical author if not already present
    if (-not $StatsByAuthor.ContainsKey($canonicalAuthor)) {
        $StatsByAuthor[$canonicalAuthor] = [PSCustomObject]@{
            Name = $canonicalAuthor
            Commits = 0
            Insertions = 0
            Deletions = 0
            RawNames = @() # To track which names were merged
        }
    }

    # Add the current raw author name to the list for tracking
    $StatsByAuthor[$canonicalAuthor].RawNames += $author

    Write-Host "Processing: '$author' (Merging into '$canonicalAuthor')..."

    # --- Commits Count ---
    # We count commits first using the original name because 'git log --author' is exact
    $commitCount = git log --author="$author" --pretty=oneline | Measure-Object | Select-Object -ExpandProperty Count
    $StatsByAuthor[$canonicalAuthor].Commits += $commitCount

    # --- Lines Changed Count ---
    $insertions = 0
    $deletions = 0

    # Gather numstat lines
    $numstatLines = git log --author="$author" --pretty=tformat: --numstat

    foreach ($line in $numstatLines) {
        if ([string]::IsNullOrWhiteSpace($line)) { continue }

        $parts = $line -split "\s+"

        if ($parts.Count -lt 3) { continue }

        $ins = 0
        $del = 0

        # Safe parse numbers
        [int]::TryParse($parts[0], [ref] $ins) | Out-Null
        [int]::TryParse($parts[1], [ref] $del) | Out-Null

        $insertions += $ins
        $deletions += $del
    }

    $StatsByAuthor[$canonicalAuthor].Insertions += $insertions
    $StatsByAuthor[$canonicalAuthor].Deletions += $deletions
}

# 2. Output the final aggregated results
Write-Host "`n--- Final Merged Results ---" -ForegroundColor Yellow

$StatsByAuthor.Values | Sort-Object Name | ForEach-Object {
    Write-Host "`nAuthor: $($_.Name)" -ForegroundColor Green
    Write-Host "  Raw Names Merged: $($_.RawNames -join ', ')"
    Write-Host "  Commits:     $($_.Commits)"
    Write-Host "  Insertions:  $($_.Insertions)"
    Write-Host "  Deletions:   $($_.Deletions)"
}