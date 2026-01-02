# Mole for Windows

Windows version of Mole - a comprehensive system maintenance and optimization tool.

## Features

- **System Cleanup**: Deep clean Windows temp files, caches, browser data, and more
- **Application Uninstaller**: Completely remove applications and their leftovers
- **System Monitor**: Real-time dashboard showing CPU, memory, disk, network, and battery stats

## Installation

### Option 1: Install from Source (Recommended)

1. Clone the repository:
   ```powershell
   git clone https://github.com/tw93/mole.git
   cd mole
   ```

2. Run the installation script as Administrator:
   ```powershell
   .\install-windows.ps1
   ```

3. Restart your terminal for PATH changes to take effect

### Option 2: Manual Installation

1. Download or clone the repository
2. Copy the entire `mole` folder to a location like `C:\Program Files\Mole`
3. Add the installation directory to your system PATH
4. Build the status monitor:
   ```powershell
   .\scripts\build-status-windows.ps1
   ```

## Usage

### System Cleanup

Clean system caches, temporary files, and browser data:

```powershell
mole clean
```

Preview what would be cleaned without making changes:

```powershell
mole clean -DryRun
```

### Application Uninstaller

List all installed applications:

```powershell
mole uninstall -List
```

Uninstall an application and remove leftovers:

```powershell
mole uninstall "Google Chrome"
```

Preview what would be uninstalled:

```powershell
mole uninstall "Adobe Reader" -DryRun
```

### System Status Monitor

View real-time system metrics:

```powershell
mole status
```

Press `q` or `Esc` to exit the status monitor.

## What Gets Cleaned

### Windows User Caches
- Temporary files (`%TEMP%`, `%WINDIR%\Temp`)
- Prefetch cache
- Thumbnail and icon cache
- Windows Error Reporting dumps
- Windows Update download cache

### Browser Caches
- Google Chrome cache
- Microsoft Edge cache
- Firefox cache
- Service Worker caches

### Developer Tools
- npm cache (`~\.npm\_cacache`)
- Yarn cache (`~\.yarn\cache`)
- pip cache
- Gradle cache
- Maven old artifacts (90+ days)
- NuGet packages (60+ days)
- Visual Studio temp files

### Applications
- Discord cache
- Slack cache
- Microsoft Teams cache
- Spotify cache

### Recycle Bin
- Empties the Recycle Bin

## Requirements

- Windows 10 or later
- PowerShell 5.1 or later
- Go 1.24+ (for building the status monitor)

## Building from Source

### Build Status Monitor

```powershell
.\scripts\build-status-windows.ps1
```

This creates `bin\status-go.exe` which provides real-time system metrics.

## Differences from macOS Version

The Windows version has been adapted for Windows-specific cleanup targets:

| Feature | macOS | Windows |
|---------|-------|---------|
| System Cleanup | ✅ | ✅ |
| App Uninstaller | ✅ | ✅ |
| System Monitor | ✅ | ✅ |
| Disk Analyzer | ✅ | ⏳ Coming soon |
| Touch ID sudo | ✅ | N/A |

### Windows-Specific Features

- Windows Registry cleanup for uninstalled apps
- Windows Update cache cleaning
- Prefetch cache cleaning
- WMI-based system monitoring
- UAC elevation for system-level cleanup

### Not Yet Implemented

- Interactive disk space analyzer (use WinDirStat as alternative)
- System optimization tasks (e.g., SFC scan, DISM)
- Project artifact cleanup (node_modules, etc.) - coming soon

## Troubleshooting

### "Execution policy" error

PowerShell scripts may be blocked by default. To allow them:

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### "Access denied" errors

Some cleanup operations require administrator privileges. Run PowerShell as Administrator:

1. Right-click PowerShell
2. Select "Run as Administrator"
3. Run the `mole clean` command again

### Status monitor not found

Build the status monitor first:

```powershell
.\scripts\build-status-windows.ps1
```

## Uninstallation

Run the installation script with the `-Uninstall` flag:

```powershell
.\install-windows.ps1 -Uninstall
```

Or manually:
1. Remove `C:\Program Files\Mole` (or your installation directory)
2. Remove the installation directory from your system PATH
3. Delete any desktop shortcuts

## Safety

- Dry run mode available for all operations (`-DryRun`)
- Protected application list prevents accidental removal of critical software
- Registry backups recommended before making changes
- No system files are modified without explicit user consent

## Contributing

Contributions are welcome! The Windows version is still being developed. Priority areas:

1. Disk space analyzer (similar to macOS version)
2. System optimization tasks
3. Project artifact cleanup
4. Additional application-specific cleanup targets
5. Windows-specific health checks

## License

MIT License - see LICENSE file for details

## Credits

- Original macOS version by [Tw93](https://github.com/tw93)
- Windows port: Community contribution
- Built with [Charm](https://github.com/charmbracelet) TUI framework
- System metrics via [gopsutil](https://github.com/shirou/gopsutil)
