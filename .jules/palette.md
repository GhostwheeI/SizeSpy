## 2024-06-10 - [UX Improvement for Prompt Variables]
**Learning:** [In Windows batch scripts, `set /p` prompts retain their previous values on empty input, which can confuse users. Also, showing current variable values in the prompt context makes for a better CLI experience.]
**Action:** [Always clear input variables before `set /p` prompts and display current variable values in the prompt context (e.g., `[Current: %var%]`).]
