## 2024-06-06 - Double Drive Traversal in Batch Scanners
**Learning:** In Windows batch scripts, computing file progress by calling `dir /S /B` to count total files, and then immediately running `dir /S /B` again to process them, causes a massive O(2N) disk I/O bottleneck. Traversing a large filesystem twice is prohibitively slow.
**Action:** Cache the output of the first filesystem traversal (`dir /S /B > temp.txt`) and use that temporary file for both counting (`type temp.txt | find /C`) and processing (`for /F "usebackq" in (temp.txt)`) to halve the disk I/O operations.
