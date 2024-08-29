# Define the root directory of your project
$root = "C:\Users\RKeelan\Src\RKeelan.com"
$siteFolder = Join-Path $root "Site"

# Check if Python is installed
if (Get-Command python -ErrorAction SilentlyContinue) {
    # Start a simple HTTP server using Python
    Write-Host "Starting local server. Access the site at http://localhost:8000"
    python -m http.server 8000 --directory $siteFolder
} else {
    Write-Host "Python is not installed or not in PATH. Please install Python to run a local server."
}