# Acasic_Record: replace _archive source threads from zip (with backup)
$ErrorActionPreference = "Stop"

# --- 0) repo root を確定
$RepoRoot = (Get-Location).Path
if (-not (Test-Path (Join-Path $RepoRoot ".git"))) {
  try {
    $RepoRoot = (git rev-parse --show-toplevel).Trim()
  } catch {}
}
if (-not (Test-Path (Join-Path $RepoRoot ".git"))) {
  throw "ERROR: .git が見つかりません。UCAR_Dialy リポジトリ直下で実行してください。"
}
Set-Location $RepoRoot

# --- 1) zip 探索
$ZipPath = $null
$ZipCandidates = @("Acasic_Record.zip", "acasic_record.zip", "*Acasic*Record*.zip")
foreach ($c in $ZipCandidates) {
  $p = Get-ChildItem -Path $RepoRoot -Filter $c -File -ErrorAction SilentlyContinue | Select-Object -First 1
  if ($p) { $ZipPath = $p.FullName; break }
}
if (-not $ZipPath) {
  $home = $env:USERPROFILE
  $p = Get-ChildItem -Path $home -Recurse -Filter "Acasic_Record.zip" -File -ErrorAction SilentlyContinue | Select-Object -First 1
  if ($p) { $ZipPath = $p.FullName }
}
if (-not $ZipPath) {
  throw "ERROR: Acasic_Record.zip が見つかりません。repo直下に置いて再実行してください。"
}
Write-Host "Zip: $ZipPath"

# --- 2) _archive/source_threads_v1 のパスを確定（誤字も吸収）
$candidates = @(
  "Acasic_Record\_archive\source_threads_v1",
  "Acasic_Record\_archive\sourc_thread_v1",
  "Acasic_Record\_archive\sourc_threads_v1"
) | ForEach-Object { Join-Path $RepoRoot $_ }

$ArchiveDir = $null
foreach ($d in $candidates) {
  if (Test-Path $d) { $ArchiveDir = $d; break }
}
if (-not $ArchiveDir) {
  $ArchiveDir = Join-Path $RepoRoot "Acasic_Record\_archive\source_threads_v1"
  New-Item -ItemType Directory -Force -Path $ArchiveDir | Out-Null
}
Write-Host "ArchiveDir: $ArchiveDir"

# --- 3) 展開（temp）
$TempDir = Join-Path $env:TEMP ("ucAR_acasic_import_" + [guid]::NewGuid().ToString("N"))
New-Item -ItemType Directory -Force -Path $TempDir | Out-Null
Expand-Archive -Path $ZipPath -DestinationPath $TempDir -Force

# --- 4) zip内ファイル収集
$MdFiles  = Get-ChildItem -Path $TempDir -Recurse -Filter "*.md"  -File
$TxtFiles = Get-ChildItem -Path $TempDir -Recurse -Filter "*.txt" -File

if (($MdFiles.Count + $TxtFiles.Count) -eq 0) {
  throw "ERROR: zip 内に .md / .txt が見つかりません。"
}

# --- 5) 既存のバックアップ（念のため）
$ts = Get-Date -Format "yyyyMMdd_HHmmss"
$BackupDir = Join-Path $ArchiveDir ("_backup_" + $ts)
New-Item -ItemType Directory -Force -Path $BackupDir | Out-Null

$Existing = Get-ChildItem -Path $ArchiveDir -File -ErrorAction SilentlyContinue
foreach ($f in $Existing) {
  Copy-Item -Force -Path $f.FullName -Destination (Join-Path $BackupDir $f.Name)
}

$RawDir = Join-Path $ArchiveDir "raw"
if (Test-Path $RawDir) {
  $RawBackup = Join-Path $BackupDir "raw"
  New-Item -ItemType Directory -Force -Path $RawBackup | Out-Null
  Get-ChildItem -Path $RawDir -File -ErrorAction SilentlyContinue | ForEach-Object {
    Copy-Item -Force -Path $_.FullName -Destination (Join-Path $RawBackup $_.Name)
  }
}

Write-Host "Backup created: $BackupDir"

# --- 6) コピー実行
foreach ($f in $MdFiles) {
  Copy-Item -Force -Path $f.FullName -Destination (Join-Path $ArchiveDir $f.Name)
}

New-Item -ItemType Directory -Force -Path $RawDir | Out-Null
foreach ($f in $TxtFiles) {
  Copy-Item -Force -Path $f.FullName -Destination (Join-Path $RawDir $f.Name)
}

Write-Host ("Copied MD : " + $MdFiles.Count)
Write-Host ("Copied TXT: " + $TxtFiles.Count)
Write-Host "MD -> $ArchiveDir"
Write-Host "TXT -> $RawDir"

# --- 7) Git commit/push（main）
git checkout main | Out-Null
git add Acasic_Record | Out-Null
$changes = (git status --porcelain)
if (-not $changes) {
  Write-Host "No git changes detected. (Nothing to commit)"
} else {
  $msg = "Update Acasic sources from zip ($ts): md=$($MdFiles.Count), txt=$($TxtFiles.Count)"
  git commit -m $msg | Out-Null
  git push origin main | Out-Null
  Write-Host "Pushed: main"
}

# --- 8) temp cleanup
Remove-Item -Recurse -Force $TempDir

# zipはコミットせず削除
if (Test-Path $ZipPath) { Remove-Item -Force $ZipPath }

Write-Host "DONE"

