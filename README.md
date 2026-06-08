# SizeSpy - File & Folder Size Scanner (Batch)

![Platform: Windows](https://img.shields.io/badge/Platform-Windows-blue.svg)
![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)

**Version**: 1.8.0
**Author**: Rydell Hall
**Platform**: Windows (CMD / Batch Script)
**License**: MIT

---

## ðŸ“„ Description

SizeSpy is a standalone Windows batch utility that scans one or more drives for the **largest files and folders** above a configurable size threshold.

Designed for simplicity and portability, it's ideal for:
- Low-footprint diagnostics
- Offline audits
- Environments with no scripting runtimes or third-party tools

---

## âœ¨ Features

- âœ… Top N Largest Files & Folders
- âœ… Minimum Size Thresholds (in MB)
- âœ… Multi-Drive Selection (e.g. C,D,E)
- âœ… Optional Report Generation (TXT / CSV / Markdown)
- âœ… Export Results to .csv and .md
- âœ… Visual Output and Menu Controls
- âš ï¸ Progress Spinner (in development)

---

## ðŸ–¥ Requirements

- Windows 10/11
- Native CMD / Batch environment
- Admin privileges recommended for full drive access

---

## ðŸš€ Getting Started

1. **Download SizeSpy.bat**
2. **Right-click â†’ Run as Administrator** *(recommended)*
3. Navigate the interactive menu to:
   - [1] Set drives (e.g. C,D,E)
   - [2] Set minimum size threshold
   - [3] Set how many results to display
   - [R] Run the scan

### Usage Example
From the command line (if integrated into your path):
```cmd
C:\> SizeSpy.bat
```
Follow the interactive prompts to configure your scan. The defaults are set to scan the `C` drive for items larger than `1024 MB`, displaying the top `15` results.

---

## ðŸ›¡ï¸ Best Practices

- **Run as Administrator:** Required to accurately read system files and hidden directories.
- **Limit scan drives:** Scanning an entire drive can be time-consuming; stick to the drives you need.
- **Export Results:** Enable Report Generation to save your findings for later analysis.

---

## âš™ Preferences Explained

| Option            | Description                                                |
|-------------------|------------------------------------------------------------|
| Drives            | One or more Windows drives (e.g. C,D,E)                 |
| Min Size (MB)     | Only files/folders **larger than this** are considered    |
| Display Limit     | How many results to show per category (files/folders)     |
| Report Generation | If enabled, results are saved as .csv and .md locally |

---

## ðŸ“Š Output Examples

`
Top 10 files (>= 100 MB)
-----------------------------------------------
8435 MB    "E:\Games\huge.iso"
...

Top 10 folders
-----------------------------------------------
972 MB     "E:\SteamLibrary\DOOM"
...
`

Output files (when enabled):
- SizeSpy_Files_C.csv
- SizeSpy_Files_C.md
- SizeSpy_Folders_C.csv
- SizeSpy_Folders_C.md

---

## ðŸ§© Todo / Improvements

- [x] Support multiple drives
- [x] Export to CSV and Markdown
- [ ] Implement true progress spinner / percent complete
- [ ] Auto-launch results in Notepad / Excel
- [ ] Save/load scan profiles
- [ ] Parallelize folder size calculations

---

## ðŸªª License

MIT License â€” see LICENSE file for details.
