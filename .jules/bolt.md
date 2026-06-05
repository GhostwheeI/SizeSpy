## 2024-05-24 - Double I/O Scanning Bottleneck
**Learning:** Pre-computing `total_files` by running a full `dir /S /B` scan across an entire drive just for a progress bar completely halves the performance of the script by doubling disk I/O operations.
**Action:** Avoid traversing large file trees purely for metric collection; rely on indeterminate progress indicators (like a simple spinner or running count) when working with massive I/O operations.
