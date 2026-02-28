param(
  [Parameter(Mandatory = $true)]
  [string]$TargetPath,

  [Parameter(Mandatory = $false)]
  [string]$Stack = "generic",

  [Parameter(Mandatory = $false)]
  [switch]$RunChecks
)

$ErrorActionPreference = 'Stop'

if (-not (Test-Path $TargetPath)) {
  throw "Target path does not exist: $TargetPath"
}

$dest = Join-Path $TargetPath 'seprocess'
New-Item -ItemType Directory -Path $dest -Force | Out-Null

# 1. Copy core components
Copy-Item "$PSScriptRoot\..\core\templates\*.md" $dest -Force
Copy-Item "$PSScriptRoot\..\core\templates\*.yaml" $dest -Force
Copy-Item "$PSScriptRoot\..\core\policies\playbook.md" (Join-Path $dest 'playbook.md') -Force
Copy-Item "$PSScriptRoot\..\core\policies\quality-gates-template.md" (Join-Path $dest 'quality-gates-template.md') -Force

# 2. Copy stack-specific scaffold
$scaffoldSrc = Join-Path $PSScriptRoot "..\scaffolds\$Stack"
$scaffoldDest = Join-Path $dest 'scaffold'
New-Item -ItemType Directory -Path $scaffoldDest -Force | Out-Null

if (Test-Path $scaffoldSrc) {
  Write-Output "Installing Starter Kit for stack: $Stack"
  Copy-Item "$scaffoldSrc\*" $scaffoldDest -Force -Recurse
}

# Move and Customize pre-commit template
$preCommitSrc = Join-Path $dest 'pre-commit-config-template.yaml'
$preCommitDest = Join-Path $scaffoldDest 'pre-commit-config-template.yaml'

if (Test-Path $preCommitSrc) {
  Move-Item $preCommitSrc $preCommitDest -Force
  
  # Smart Scaffold: Customize pre-commit according to stack
  $content = Get-Content $preCommitDest -Raw
  if ($Stack -eq "python") {
    $content = $content -replace "entry: npm test", "entry: pytest"
  }
  Set-Content $preCommitDest $content

  # Instantiate: auto-copy the configured template to project root as the active config
  Copy-Item $preCommitDest (Join-Path $TargetPath '.pre-commit-config.yaml') -Force
  Write-Output "Created: .pre-commit-config.yaml in project root."
}

# 3. Copy adapters
Copy-Item "$PSScriptRoot\..\adapters" $dest -Force -Recurse

# 4. Create persistent session folder
New-Item -ItemType Directory -Path (Join-Path $dest 'sessions') -Force | Out-Null

# 5. Optional smoke test checks
if ($RunChecks) {
  Write-Output "Running optional post-install smoke checks..."

  $templateCheckScript = Join-Path $scaffoldDest 'check-template-hygiene.py'
  if (-not (Test-Path $templateCheckScript)) {
    Write-Warning "Template hygiene checker not found at '$templateCheckScript'. Skipping smoke check."
  }
  else {
    $pythonCmd = Get-Command python -ErrorAction SilentlyContinue
    if ($pythonCmd) {
      & python $templateCheckScript
      if ($LASTEXITCODE -ne 0) {
        throw "Smoke check failed: template hygiene checker returned exit code $LASTEXITCODE"
      }
    }
    else {
      $pyCmd = Get-Command py -ErrorAction SilentlyContinue
      if ($pyCmd) {
        & py $templateCheckScript
        if ($LASTEXITCODE -ne 0) {
          throw "Smoke check failed: template hygiene checker returned exit code $LASTEXITCODE"
        }
      }
      else {
        Write-Warning "Python runtime not found (python/py). Skipping smoke check."
      }
    }
  }
}

Write-Output "Engineering artifacts installed into: $dest"

# 6. Final Instructions
$installCmd = if ($Stack -eq "python") { "uv add pre-commit --dev" } else { "npm install pre-commit --save-dev" }
Write-Output "Next Steps:"
Write-Output "1. Choose an adapter from seprocess/adapters/ and paste the session starter prompt into your IDE assistant context."
Write-Output "2. Install the pre-commit tool: '$installCmd'"
Write-Output "3. Activate hooks: 'pre-commit install' (config already at project root!)"
Write-Output "4. Create session work files from templates under seprocess/sessions/ (do not fill *template* files directly)."
Write-Output "Optional: re-run smoke checks with '-RunChecks' on install command."
