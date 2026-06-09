## 2024-06-25 - Throttling CLI output in Windows Batch files
**Learning:** In Windows batch scripts, frequent console writes (like `<nul set /p=`) inside tight loops cause massive I/O bottlenecks. Additionally, using `call` (e.g. `call set` for dynamic strings) inside a loop is very CPU bound because it creates a new environment context per iteration.
**Action:** Mitigate this by explicitly throttling UI updates using modulo math (e.g. `set /a "update_ui=progress %% 100"`) and bypass `call` using nested `if` statements for logic inside loops to significantly reduce overhead.
