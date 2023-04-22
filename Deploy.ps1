# Copy the website

$srcFolder = "Site"
$destFolder = "rkeelan"
$zipFile = "rkeelan.zip"

# Create the zip archive
Copy-Item $srcFolder $destFolder -recurse -force
Add-Type -Assembly System.IO.Compression.FileSystem
[System.IO.Compression.ZipFile]::CreateFromDirectory($destFolder, $zipFile)
Remove-Item -Recurse -Force rkeelan

# Copy to the server
$username = "richato4"
$hostname = "rkeelan.com"
$userhost = "$username@$hostname"

scp $zipFile $userhost":"$zipFile
Remove-Item $zipFile