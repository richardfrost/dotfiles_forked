$dotfiles = 'D:\Git\Personal\dotfiles'
$symlinks = Get-ChildItem -Path $dotfiles -Depth 2 -Include '*.symlink' -Exclude '.git'
foreach ($symlink in $symlinks) {
    $name = ".$($symlink.BaseName)"
    if ($symlink -is [System.IO.DirectoryInfo]) {
        $name = $name -replace '\.symlink', ''
    }

    # Check if destination already exists
    # Prompt for skip?
    # We need to also check if its already a symlink?
    if (Test-Path -Path "$HOME\$name") {
        Move-Item -Path "$HOME\$name" -Destination "$HOME\$name.bak-$(Get-Date -format 'yyyy-MM-dd-HHmm')"    
    } else {
        $name = $name -replace '\.symlink', ''
    }

    New-Item -ItemType SymbolicLink -Path "$HOME" -Name "$name" -Target "$symlink"
}
