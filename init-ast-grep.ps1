# init-ast-grep.ps1
# Drops the global ast-grep lint config (sgconfig.yml + rules/) into the current repo.
# Run from the repo root:
#   pwsh "$env:USERPROFILE\.config\opencode\init-ast-grep.ps1"
# Then:  ast-grep scan
$src = Join-Path $env:USERPROFILE ".config\opencode\ast-grep-rules"
$dst = Get-Location
if (-not (Test-Path $src)) {
  Write-Error "Global ast-grep template not found at $src. Run the OpenCode tool-setup first."
  exit 1
}
Copy-Item (Join-Path $src "sgconfig.yml") $dst -Force
Copy-Item (Join-Path $src "rules") $dst -Recurse -Force
Write-Host "ast-grep config copied to $dst"
Write-Host "Run 'ast-grep scan' to lint the project."
