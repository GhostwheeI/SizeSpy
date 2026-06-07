## 2024-06-07 - Windows Batch UX Insights
**Learning:** `set /p` prompts in Windows Batch retain the variable's previous value if the user just presses Enter. This can cause frustrating UX loops (e.g., repeatedly selecting a menu option without meaning to). Also, users modifying CLI configuration values benefit greatly from seeing the current value in the prompt.
**Action:** Always clear input variables (e.g., `set "choice="`) before prompting with `set /p` in batch scripts. Also, include context like `[Current: %var%]` in configuration prompts so users know what they are overwriting.
