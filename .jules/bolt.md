## 2024-06-09 - Batch Script CPU Bottlenecks with `call` and Console I/O
**Learning:** Using `call` inside loops (e.g., `call set`) in batch scripts creates new environment contexts, causing severe CPU overhead. Additionally, excessive console output (e.g., `<nul set /p=`) causes I/O bottlenecks.
**Action:** Throttle loop operations using modulo math (`%%`) and avoid `call` by using explicit logic (like `if` statements) to bypass the overhead.
