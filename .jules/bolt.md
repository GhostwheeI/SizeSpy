## 2024-06-10 - Batch Script Dynamic Substrings vs Throttling
**Learning:** In Windows batch scripts, using `call` inside a loop (like `call set` for dynamic substrings) is extremely CPU-bound because it creates a new environment context per iteration. Frequent console writes (like `<nul set /p=`) also cause I/O bottlenecks.
**Action:** Mitigate this by throttling operations using modulo math (`%%`) and using explicit logic (e.g., nested `for` loops or `if` statements) to bypass the `call` overhead, dramatically speeding up script execution times over large datasets.
