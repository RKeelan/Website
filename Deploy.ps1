# Build the Astro site first
Write-Host "Building Astro site..."
npm run build

# Copy the website
$root = "C:\Users\RKeelan\Src\RKeelan.com"
$srcFolder = Join-Path $root "dist"
$destFolder = Join-Path $root "rkeelan"

$zipFile = "rkeelan.zip"
$zipPath = Join-Path $root $zipFile

# Create the zip archive
Copy-Item $srcFolder $destFolder -recurse -force
Add-Type -Assembly System.IO.Compression.FileSystem
[System.IO.Compression.ZipFile]::CreateFromDirectory($destFolder, $zipPath)
Remove-Item -Recurse -Force $destFolder

# Server credentials
$username = "richato4"
$hostname = "rkeelan.com"
$userhost = "$username@$hostname"

# Upload the zip file
scp $zipPath $userhost":"$zipFile

# Execute server-side commands to remove old directory and unzip
$commands = @(
    "rm -rf public_html",
    "unzip $zipFile -d public_html",
    "rm $zipFile"
)
$sshCommand = $commands -join "; "

# Use SSH to execute the commands on the server
ssh $userhost $sshCommand

# Clean up local zip file
Remove-Item $zipPath
