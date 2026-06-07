## 2024-05-20 - Batch Loop Bottlenecks
**Learning:** In Windows batch scripts, using `call` inside a `for` loop (like `call set` for dynamic substring extraction) is extremely CPU-bound. It creates a new variable environment context for every iteration, slowing down script execution by orders of magnitude for large disk scans. Additionally, writing to stdout (like `<nul set /p=`) on every single file is a major bottleneck.
**Action:** Throttle console updates using modulo (`%%`) and replace dynamic substring `call` tricks with explicit `if` statements to bypass the `call` overhead entirely.
