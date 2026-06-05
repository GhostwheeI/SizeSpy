## 2024-06-05 - [Batch Loop Performance Bottleneck]
**Learning:** Using `call set` or performing frequent command prompt output (`<nul set /p=`) inside tight file scanning loops in Windows Batch severely limits execution speed due to subshell evaluations and high I/O overhead.
**Action:** Replaced `call set` with modulo arithmetic (`set /a mod=progress %% 100`) and standard `if` blocks to throttle visual spinner updates to every 100th file, removing the per-file rendering bottleneck.
