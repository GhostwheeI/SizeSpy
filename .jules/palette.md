## 2024-06-09 - Clear Batch Script Inputs and Show Context
**Learning:** In Windows batch scripts, `set /p` prompts retain their previous values if the user inputs nothing (just presses Enter). This can cause unexpected behavior.
**Action:** Always clear input variables (e.g., `set "var="`) before a `set /p` prompt and display the current value context (e.g., `[Current: %var%]`) for better CLI UX. Handle empty inputs to revert to the old value if needed.
