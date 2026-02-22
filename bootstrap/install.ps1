param(
  [Parameter(Mandatory = $true)]
  [string]$TargetPath,

  [Parameter(Mandatory = $false)]
  [string]$Stack = "generic"
)

$ErrorActionPreference = 'Stop'

if (-not (Test-Path $TargetPath)) {
  throw "Target path does not exist: $TargetPath"
}

$dest = Join-Path $TargetPath 'seprocess'
New-Item -ItemType Directory -Path $dest -Force | Out-Null

# 1. Copy core components
Copy-Item "$PSScriptRoot\..\core\templates\*.md" $dest -Force
Copy-Item "$PSScriptRoot\..\core\policies\playbook.md" (Join-Path $dest 'playbook.md') -Force
Copy-Item "$PSScriptRoot\..\core\policies\quality-gates-template.md" (Join-Path $dest 'quality-gates-template.md') -Force

# 2. Copy stack-specific scaffold
$scaffoldSrc = Join-Path $PSScriptRoot "..\scaffolds\$Stack"
if (Test-Path $scaffoldSrc) {
  Write-Output "Installing Starter Kit for stack: $Stack"
  $scaffoldDest = Join-Path $dest 'scaffold'
  New-Item -ItemType Directory -Path $scaffoldDest -Force | Out-Null
  Copy-Item "$scaffoldSrc\*" $scaffoldDest -Force -Recurse
}
else {
  Write-Warning "Scaffold for stack '$Stack' not found. Skipping starter kit."
}

Write-Output "Engineering artifacts installed into: $dest"
Write-Output "Next: choose an adapter from adapters/ and paste the session starter prompt into your IDE assistant context."
