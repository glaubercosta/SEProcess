param(
  [string]$SessionsPath = "seprocess/sessions"
)

$ErrorActionPreference = 'Stop'

if (-not (Test-Path $SessionsPath)) {
  Write-Output "Template hygiene check skipped: '$SessionsPath' not found."
  exit 0
}

$patterns = @(
  'TEMPLATE_ONLY',
  '\[Step\]',
  '\[Question\]',
  '\[Objective\]',
  '\[Out of scope item\]',
  '\[value\]'
)

$files = Get-ChildItem -Path $SessionsPath -Recurse -File | Where-Object { $_.Extension -eq '.md' }
if (-not $files) {
  Write-Output "Template hygiene check skipped: no markdown artifacts found in '$SessionsPath'."
  exit 0
}

$matches = @()
foreach ($file in $files) {
  $content = Get-Content $file.FullName -Raw
  foreach ($pattern in $patterns) {
    if ($content -match $pattern) {
      $matches += "$($file.FullName) :: pattern '${pattern}'"
      break
    }
  }
}

if ($matches.Count -gt 0) {
  Write-Error "Template hygiene check failed. Unresolved template markers found:`n$($matches -join "`n")"
  exit 1
}

Write-Output "Template hygiene check passed."
