# Copy the website

$root = "C:\Users\RKeelan\Src\RKeelan.com"
$srcFolder = Join-Path $root "Site"
$destFolder = Join-Path $root "rkeelan"

$zipFile = "rkeelan.zip"
$zipPath = Join-Path $root zipFile

# Create the zip archive
Copy-Item $srcFolder $destFolder -recurse -force
Add-Type -Assembly System.IO.Compression.FileSystem
[System.IO.Compression.ZipFile]::CreateFromDirectory($destFolder, $zipPath)
Remove-Item -Recurse -Force rkeelan

# Copy to the server
$username = "richato4"
$hostname = "rkeelan.com"
$userhost = "$username@$hostname"

scp $zipPath $userhost":"$zipFile
Remove-Item $zipPath