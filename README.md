# SizeSpy - File & Folder Size Scanner (Batch)

**Version**: 1.7.7  
**Author**: Rydell Hall  
**Platform**: Windows (CMD / Batch Script)  
**License**: MIT

---

## 📄 Description

SizeSpy is a standalone Windows batch utility that scans one or more drives for the **largest files and folders** above a configurable size threshold.

Designed for simplicity and portability, it's ideal for:
- Low-footprint diagnostics
- Offline audits
- Environments with no scripting runtimes or third-party tools

---

## ✨ Features

- ✅ Top N Largest Files & Folders
- ✅ Minimum Size Thresholds (in MB)
- ✅ Multi-Drive Selection (e.g. C,D,E)
- ✅ Optional Report Generation (TXT / CSV / Markdown)
- ✅ Export Results to .csv and .md
- ✅ Visual Output and Menu Controls
- ⚠️ Progress Spinner (in development)

---

## 🖥️ Requirements

- Windows 10/11
- Native CMD / Batch environment
- Admin privileges recommended for full drive access

---

## 🚀 Getting Started

1. **Download SizeSpy.bat**
2. **Right-click → Run as Administrator** *(recommended)*
3. Navigate the interactive menu to:
   - [1] Set drives (e.g. C,D,E)
   - [2] Set minimum size threshold
   - [3] Set how many results to display
   - [R] Run the scan

---

## ⚙️ Preferences Explained

| Option            | Description                                                |
|-------------------|------------------------------------------------------------|
| Drives            | One or more Windows drives (e.g. C,D,E)                 |
| Min Size (MB)     | Only files/folders **larger than this** are considered    |
| Display Limit     | How many results to show per category (files/folders)     |
| Report Generation | If enabled, results are saved as .csv and .md locally |

---

## 📊 Output Examples

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

## 🧩 Todo / Improvements

- [x] Support multiple drives
- [x] Export to CSV and Markdown
- [x] Implement true progress spinner / percent complete
- [ ] Auto-launch results in Notepad / Excel
- [ ] Save/load scan profiles
- [ ] Parallelize folder size calculations

---

## 🪪 License

MIT License — see LICENSE file for details.

