param(
    [string]$VenvPath = ".venv"
)

$ErrorActionPreference = 'Stop'

Write-Output "--- Initializing Python Environment ---"

# 1. Create venv if not exists
if (-not (Test-Path $VenvPath)) {
    Write-Output "Creating virtual environment in $VenvPath..."
    python -m venv $VenvPath
}

# 2. Upgrade pip and install requirements
$pip = Join-Path $VenvPath "Scripts\pip.exe"
if (-not (Test-Path $pip)) {
    $pip = Join-Path $VenvPath "bin/pip" # Linux/macOS fallback
}

Write-Output "Upgrading pip..."
& $pip install --upgrade pip

if (Test-Path "requirements.txt") {
    Write-Output "Installing dependencies from requirements.txt..."
    & $pip install -r requirements.txt
}

Write-Output "--- Environment Ready ---"
Write-Output "To activate, run: .\$VenvPath\Scripts\Activate.ps1"
