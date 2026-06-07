## 2024-06-07 - Mitigating Context Switching in Batch Script Loops
**Learning:** In Windows batch scripts, using `call` inside a loop (like `call set` for dynamic substrings) is extremely CPU-bound because it creates a new environment context per iteration. Frequent console writes (like `<nul set /p=`) also cause I/O bottlenecks.
**Action:** Mitigated this by throttling operations using modulo math (`%%`) to update every 50 iterations, and using explicit logic (nested `if` conditions) to completely bypass the `call` context creation overhead per loop cycle.
