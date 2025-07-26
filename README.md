# SizeSpy 🕵️ – File & Folder Size Scanner (Batch)

**Version**: 1.7.3  
**Author**: Rydell Hall  
**Platform**: Windows (CMD / Batch Script)  
**License**: MIT

---

## 📋 Description

SizeSpy is a Windows batch utility that scans a drive for the largest files and folders above a specified size threshold.

Built with **simplicity**, **portability**, and **offline compatibility** in mind, it is ideal for quick audits or low-footprint environments.

---

## 🔧 Features

- **Top N Largest Files & Folders**
- **Minimum Size Thresholds (MB)**
- **Drive Selection**
- **Report Preview Before Scan**
- **Optional Report Logging**
- **Progress Feedback**
- **No Admin Required** (but recommended for full access)

---

## 📦 Requirements

- Windows (Tested on Windows 10/11)
- CMD / Batch compatible environment

---

## 🚀 Getting Started

1. **Download `SizeSpy.bat`**
2. **Run as Administrator** *(recommended)*
3. Use the interactive menu to:
   - (R) Run a scan
   - (C) Set preferences (Drive, Size, Limit)
   - (Q) Quit

---

## 🛠 Preferences Explained

| Option           | Description                                                |
|------------------|------------------------------------------------------------|
| Drive            | Any valid Windows drive (e.g. `C`, `D`, `E`)               |
| Min Size (MB)    | Files/folders must be larger than this to be listed        |
| Display Limit    | How many files *and* folders to display (each, not total)  |
| Report Generation| If enabled, a text file is saved alongside visual output   |

---

## ⚠ Notes

- Folder size scan is **slower**, especially on drives with deep structures.
- Large files may exceed 32-bit limits in standard CMD math.
  - This is currently mitigated by using **PowerShell** conversions in isolated, simple calls.
- Avoid special characters or quotes when inputting drive letters or sizes.
- Currently, files and folders are scanned **separately**.

---

## 📁 Example Output

```
Top 15 files  (>= 1024 MB)
-----------------------------------------------
8435 MB    "E:\SteamLibrary\...\gameresources.resources"
...
-----------------------------------------------

Top 15 folders
-----------------------------------------------
972 MB     "E:\SteamLibrary\steamapps\common\DOOM"
...
-----------------------------------------------
```

---

## ✅ Todo / Improvements

- [ ] Allow scanning multiple drives at once
- [ ] Implement parallel processing
- [ ] Save/load scan profiles
- [ ] Improve progress indication per-folder
- [ ] Replace slow folder size calculation with faster PowerShell logic
- [ ] Export to CSV

---

## 📄 License

MIT License – See LICENSE file for more.
