## 2024-06-10 - [Performance Optimization for Batch UI Updates]
**Learning:** [Using `call` inside a loop in Windows batch scripts is extremely CPU-bound. Frequent console writes (like `<nul set /p=`) also cause I/O bottlenecks.]
**Action:** [Mitigate this by throttling operations using modulo math (`%%`) and using explicit logic (e.g., nested `for` loops or `if` statements) to bypass the `call` overhead.]
