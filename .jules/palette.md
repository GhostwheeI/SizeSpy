## 2026-06-05 - Contextual CLI Prompts
**Learning:** Users lack visibility into their current configuration when updating settings in sequential, interactive CLI prompts, leading to higher cognitive load as they must memorize previous states before initiating a change.
**Action:** Always inject the existing/current value directly into the input prompt string (e.g., `[Current: X]`) before asking the user for a new value, turning blind inputs into contextual updates.
