## 2024-06-08 - Throttle Batch File Console Updates
**Learning:** In Windows batch scripts, using `call` inside a tight loop (like `call set` for dynamic substrings) is extremely CPU-bound because it creates a new environment context per iteration. Frequent console writes (`<nul set /p=`) also cause severe I/O bottlenecks.
**Action:** Throttle console writes and expensive variable evaluations in loops by using modulo math (e.g. `set /a "mod=progress %% 100"` and `if !mod! equ 0`) and replace `call set` with static variable assignments where possible.
