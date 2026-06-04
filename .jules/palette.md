## 2024-06-04 - Dynamic CLI Progress Spinner
**Learning:** In CLI environments, continuously printing new lines for progress updates can spam the terminal and reduce readability, harming the UX for long-running scripts.
**Action:** Implemented an inline progress spinner using the Carriage Return (`!CR!`) character and calculated percentage completion in `SizeSpy.bat`, allowing the terminal to overwrite the current line and provide a clean, accessible progress indication.
