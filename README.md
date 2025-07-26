# 📂 SizeSpy – Disk Usage Scanner in Pure Batch

> **Version:** 1.7.3  
> **Author:** Rydell Hall  
> **README.md Last Updated:** July 2025  
> **License:** MIT

---

## 🔍 Overview

`SizeSpy` is a fully functional, menu-driven batch script that scans the disk for the largest files and folders. It's designed for Windows users who want insights into disk usage using **only native tools** – no PowerShell, no third-party apps.

Features include:
- ✅ Scans user-defined drive
- ✅ Filters by minimum size (Currently in MB)
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

<img width="1225" height="657" alt="image" src="https://github.com/user-attachments/assets/753770ed-60da-4220-b376-8531d5210be9" />

---

## 🚧 Known Limitations

- Folder size calculation is based on parsing `dir /s` output, which is inconsistent across regional settings and can break parsing logic.
- Output parsing is fragile due to hardcoded assumptions (e.g., position of summary lines).
- Cannot filter results strictly by *individual* file size — only directory totals.
- Result sorting is crude; true size-aware sorting is not guaranteed.
- Variables and menu input logic can break if invalid values or special characters are entered.
- Script revisions were prone to logic conflicts due to lack of structure and modularity.

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
