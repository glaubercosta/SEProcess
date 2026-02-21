param(
  [Parameter(Mandatory = $true)]
  [string]$TargetPath
)

$ErrorActionPreference = 'Stop'

if (-not (Test-Path $TargetPath)) {
  throw "Target path does not exist: $TargetPath"
}

$dest = Join-Path $TargetPath 'engineering-artifacts'
New-Item -ItemType Directory -Path $dest -Force | Out-Null

Copy-Item "$PSScriptRoot\..\core\templates\*.md" $dest -Force
Copy-Item "$PSScriptRoot\..\core\policies\playbook.md" (Join-Path $dest 'playbook.md') -Force
Copy-Item "$PSScriptRoot\..\core\policies\quality-gates-template.md" (Join-Path $dest 'quality-gates-template.md') -Force

Write-Output "Engineering artifacts installed into: $dest"
Write-Output "Next: choose an adapter from adapters/ and paste the session starter prompt into your IDE assistant context."
