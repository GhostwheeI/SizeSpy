## 2024-06-25 - Clearing and Contextualizing Prompt Variables in CLI

**Learning:** In Windows batch scripts, `set /p` prompts retain the previous variable value if the user simply hits Enter (empty input). This can cause confusion since the hidden state isn't visually communicated, leading to poor CLI UX and potential unexpected behavior.
**Action:** Always clear variables before using `set /p` (e.g., `set "var="`). Additionally, improve transparency by saving the previous value, displaying it in the prompt string (e.g., `[Current: %prev_var%]`), and restoring it if the new input is empty.
