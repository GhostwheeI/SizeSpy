# 📂 SizeSpy – Disk Usage Scanner in Pure Batch

> **Version:** 1.7.3  
> **Author:** Rydell Hall  
> **Last Updated:** July 2025  
> **License:** MIT

---

## 🔍 Overview

`SizeSpy` is a fully functional, menu-driven batch script that scans the disk for the largest files and folders. It's designed for Windows users who want insights into disk usage using **only native tools** – no PowerShell, no third-party apps.

Features include:
- ✅ Scans user-defined drives
- ✅ Filters by minimum size (in MB)
- ✅ Displays top N results
- ✅ Optionally generates a report file
- ✅ Customizable via a simple UI loop
- ✅ Runs with no dependencies

---

## 💡 Use Cases

- Clean up large video or log directories  
- Identify storage hogs on shared drives  
- Audit systems without installing new software  
- Embed in IT maintenance scripts

---

## ⚙️ Installation

Clone the repo (once it's created):

```bash
git clone https://github.com/your-username/SizeSpy.git
```

Then just run the script:

```bash
SizeSpy.bat
```

No installation required – just double-click or run from a command line.

---

## 🖥️ Main Menu Preview

```
============================================
          DISK SCANNER MAIN MENU
============================================

(R) Run                - Perform scan with current settings
(C) Change Drive       - Default = C:
(S) Set Min Size MB    - Default = 1024 MB
(D) Display Top N      - Default = 15
(T) Toggle Report      - Currently: Disabled
(Q) Quit
```

---

## 🔧 Configuration Options

| Setting         | Description                                | Default     |
|----------------|--------------------------------------------|-------------|
| `scan_drive`    | The drive letter (with colon) to scan      | `C:`        |
| `min_size_mb`   | Minimum file/folder size to display        | `1024` MB   |
| `display_limit` | Number of entries to display               | `15`        |
| `report_enabled`| Whether to create a text report file       | `0` (off)   |

Settings can be changed interactively during runtime.

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

<img width="1231" height="667" alt="image" src="https://github.com/user-attachments/assets/4106018e-26b0-4d3f-8900-33be860a58cb" />



---

## 🚧 Known Limitations

- Only runs on Windows (uses `dir`, `for`, `findstr`, etc.)
- Cannot recurse symbolic links
- Does not handle junctions separately
- Uses simple numeric sorting (not size-aware sort)

---

## 🚀 Future Improvements (Planned)

- [ ] PowerShell version for more precise size parsing
- [ ] Network drive support
- [ ] Auto-email report
- [ ] GUI version using HTA or Electron
- [ ] Multilingual support

---

## 🧠 Author & Acknowledgments

Created by **Rydell Hall**  
Assisted by ChatGPT + custom GPT tooling  
Special thanks to all batch scripting communities online!

---

## 📝 License

This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.
