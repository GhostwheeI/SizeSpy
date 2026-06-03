## 2024-06-03 - CLI Spinner Overwrite
**Learning:** Terminal output streams that continually append progress updates (like spinners or percentage counts) create cluttered, unreadable UX in CLI tools.
**Action:** In Windows Batch, capture a true Carriage Return character (using `for /f %%A in ('copy /Z "%~f0" nul') do set "CR=%%A"`) and prepend it to progress strings (`!CR!Scanning...`) to force in-place line overwriting for a clean update loop.
