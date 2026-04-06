[CmdletBinding()]
param(
  [string]$StageDir = "dist/firefox",
  [string]$ArchivePath = "dist/visual-tab-manager-firefox.zip"
)

$ErrorActionPreference = "Stop"

$repoRoot = (Resolve-Path (Join-Path $PSScriptRoot "..")).Path

function Resolve-RepoPath {
  param(
    [Parameter(Mandatory = $true)]
    [string]$RelativePath
  )

  $fullPath = [System.IO.Path]::GetFullPath((Join-Path $repoRoot $RelativePath))
  $rootPath = [System.IO.Path]::GetFullPath($repoRoot + [System.IO.Path]::DirectorySeparatorChar)

  if (-not $fullPath.StartsWith($rootPath, [System.StringComparison]::OrdinalIgnoreCase)) {
    throw "Refusing to operate outside the repository root: $RelativePath"
  }

  return $fullPath
}

$stagePath = Resolve-RepoPath $StageDir
$archiveFullPath = Resolve-RepoPath $ArchivePath
$archiveDir = Split-Path -Parent $archiveFullPath

if (Test-Path -LiteralPath $stagePath) {
  Remove-Item -LiteralPath $stagePath -Recurse -Force
}

New-Item -ItemType Directory -Force -Path $stagePath | Out-Null
New-Item -ItemType Directory -Force -Path $archiveDir | Out-Null

$copies = @(
  @{ Source = "src/manifest-ff.json"; Destination = "manifest.json" },
  @{ Source = "src/background/background.js"; Destination = "background/background.js" },
  @{ Source = "src/common"; Destination = "common" },
  @{ Source = "src/content"; Destination = "content" },
  @{ Source = "src/manager"; Destination = "manager" },
  @{ Source = "src/popup"; Destination = "popup" },
  @{ Source = "src/icons/icon-16.svg"; Destination = "icons/icon-16.svg" },
  @{ Source = "src/icons/icon-32.svg"; Destination = "icons/icon-32.svg" },
  @{ Source = "src/icons/icon-48.svg"; Destination = "icons/icon-48.svg" },
  @{ Source = "src/icons/icon-128.svg"; Destination = "icons/icon-128.svg" }
)

if (Test-Path -LiteralPath (Join-Path $repoRoot "LICENSE")) {
  $copies += @{ Source = "LICENSE"; Destination = "LICENSE" }
}

foreach ($copy in $copies) {
  $sourcePath = Resolve-RepoPath $copy.Source
  $destinationPath = Join-Path $stagePath $copy.Destination
  $destinationParent = Split-Path -Parent $destinationPath

  if ($destinationParent) {
    New-Item -ItemType Directory -Force -Path $destinationParent | Out-Null
  }

  Copy-Item -LiteralPath $sourcePath -Destination $destinationPath -Recurse -Force
}

if (Test-Path -LiteralPath $archiveFullPath) {
  Remove-Item -LiteralPath $archiveFullPath -Force
}

$archiveItems = Get-ChildItem -LiteralPath $stagePath -Force
if (-not $archiveItems) {
  throw "The Firefox staging directory is empty."
}

Compress-Archive -LiteralPath $archiveItems.FullName -DestinationPath $archiveFullPath -Force

Write-Host "Firefox package staged at: $stagePath"
Write-Host "Firefox archive created at: $archiveFullPath"

if ($env:GITHUB_OUTPUT) {
  Add-Content -Path $env:GITHUB_OUTPUT -Value "stage_dir=$stagePath"
  Add-Content -Path $env:GITHUB_OUTPUT -Value "archive_path=$archiveFullPath"
}
