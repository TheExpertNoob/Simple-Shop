# Some script I wrote to hardlink torrents to another directory so I can
# contiune seeding torrents and then rename and organize the hardlinked files
# to work with Tinfoil and this shop.
# Hardlinking does not take up additional harddrive space.
##############################################################################
# Modify sourceDir to where your completed torrents reside.
# Modify destDir to where you want to rename, sort, organise files for the
# shop using NXFileViewer.
##############################################################################

# Define source and destination directories (must be on the same volume)
$sourceDir = "D:\path\to\completed\Torrents"
$destDir = "D:\other\path\to\rename\and\Sort"

# Ensure the destination directory exists, or create it if not
if (-not (Test-Path -Path $destDir -PathType Container)) {
    New-Item -Path $destDir -ItemType Directory
}

# Function to create hard links for files inside subdirectories
function Create-HardLinks {
    param (
        [string]$source,
        [string]$destination
    )

    Get-ChildItem -Path $source -File -Recurse | ForEach-Object {
        $sourceFile = $_.FullName
        $destFile = Join-Path -Path $destination -ChildPath $_.Name

        $destDir = [System.IO.Path]::GetDirectoryName($destFile)

        if (-not (Test-Path -Path $destDir -PathType Container)) {
            New-Item -Path $destDir -ItemType Directory
        }

        # Check if the destination file already exists before creating a hard link
        if (-not (Test-Path -Path $destFile -PathType Leaf)) {
            fsutil hardlink create "$destFile" "$sourceFile"
            Write-Host "Created hard link: $destFile"
        }
    }
}

# Call the function to start the process
Create-HardLinks -source $sourceDir -destination $destDir

Write-Host "All hard links created successfully."