# 📂 SizeSpy – Disk Usage Scanner in Pure Batch

> **Version:** 1.7.3  
> **Author:** Rydell Hall  
> **README.md Last Updated:** July 2025  
> **License:** MIT

---

## 🔍 Overview

`SizeSpy` is a *work-in-progress*, menu-driven batch script that scans a target drive for the largest files and folders. It uses built-in Windows tools (like `dir`, `findstr`, and `for`) to generate basic reports and summaries — no PowerShell or third-party apps required.

⚠️ This tool is currently under development. Several known issues affect stability, accuracy, and usability. While mostly functional, it is **not production-ready**.

Features (in current state):
- ✅ Basic drive scan using `dir /s`
- ✅ Filter results based on size
- ✅ Menu-based navigation (see below)
- ✅ Experimental report generation
- 🧪 Ongoing improvements in logic and accuracy

---

## 💡 Use Cases

- Clean up large video or log directories  
- Identify storage hogs on shared drives  
- Audit systems without installing new software  
- Embed in IT maintenance scripts

---

## ⚙️ Installation

Clone the repo:

```bash
git clone https://github.com/your-username/SizeSpy.git
```

Then just run the script:

```bash
SizeSpy.bat
```

---

## 🖥️ Main Menu Preview

```
============================================
       DISK SCANNER MAIN MENU Version a1.7.3
============================================

         Current Preferences
Drive to Scan           = C:Minimum Size Threshold  = 1024 MB
Display Limit           = 15
Report Generation       = Disabled

(R) Run             - Perform scan with current settings
(C) Set Preferences - Change drive, thresholds, etc.
(Q) Quit            - Exit the script

Choice (R/C/Q):
```

---

## 🔧 Configuration Options

| Setting         | Description                                | Default     |
|----------------|--------------------------------------------|-------------|
| `scan_drive`    | The drive letter (with colon) to scan      | `C:`        |
| `min_size_mb`   | Minimum file/folder size to display        | `1024` MB   |
| `display_limit` | Number of entries to display               | `15`        |
| `report_enabled`| Whether to create a text report file       | `0` (off)   |

---

## 📁 Output Format

When report mode is enabled, a file is generated in the script directory containing:
- Path of each item
- Size in bytes and MB
- Timestamp of last modification

---

## 🧪 Example Usage Scenarios

- Run `SizeSpy` on a USB drive:
  - Change Drive → `E:`
  - Minimum Size → `200 MB`
  - Display Top → `10`

- Scheduled scan to a report:
  - Enable report mode
  - Use Task Scheduler to run `SizeSpy.bat` daily

---

## 📸 Screenshots

<img width="1225" height="657" alt="image" src="https://github.com/user-attachments/assets/753770ed-60da-4220-b376-8531d5210be9" />

---

## 🚧 Known Limitations

- Output parsing may break depending on system locale or regional formats (e.g. commas in numbers).
- Folder size is estimated from cumulative `dir` output and may include unwanted subfolders.
- Sorting is text-based and may not reflect actual largest files/folders in order.
- Input validation is fragile; bad or unexpected input can break menu logic.
- No confirmation prompt exists for any destructive actions.
- Menu logic and core scan logic have overlapping responsibilities — difficult to maintain or modularize.
- Error handling is minimal.

---

## 🚀 Future Improvements (Planned)

- [ ] Add option to select and delete a file or folder from results
- [ ] Simplify and modularize internal logic to avoid revision conflicts and improve stability

---

## 🧠 Author & Acknowledgments

Created by **Rydell Hall**  
Special thanks to all batch scripting communities online!

---

## 📝 License

This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.
