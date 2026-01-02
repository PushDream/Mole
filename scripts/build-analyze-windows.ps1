# Build script for Windows disk analyzer
# Note: The disk analyzer is currently macOS-only (//go:build darwin)
# This is a placeholder for future Windows implementation

#Requires -Version 5.1

$ErrorActionPreference = "Stop"

Write-Host "Note: Disk analyzer is currently macOS-only" -ForegroundColor Yellow
Write-Host "Windows version coming soon!" -ForegroundColor Gray
Write-Host ""
Write-Host "For now, use the built-in Windows Storage Sense or third-party tools like WinDirStat" -ForegroundColor Gray

exit 0
