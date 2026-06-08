## 2023-10-27 - Input Variables & CPU Bottlenecks in CLI
**Learning:** Empty user inputs during `set /p` prompts in batch scripts retain previous values. CPU bottlenecks and I/O thrashing happen easily inside `for` loops utilizing `call` and frequent console prints.
**Action:** Cleared input variables prior to prompt and added `[Current: %var%]` for clarity. Refactored the core scanning loop by bypassing the explicit `call` statement and throttling `set /p` output using a 100-file modulo step, drastically improving parsing efficiency.
