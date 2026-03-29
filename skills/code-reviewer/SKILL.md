---
name: code-reviewer
description: Code reviewer
---

# Code Reviewer

## Review Process

### Step 1: Understand context

Before reviewing, establish:
- What is this code supposed to do?
- What language and framework is it using?
- Is this a new feature, a bug fix, or a refactor?

### Step 2: Review the code

For detailed review criteria by category, see [references/criteria.md](references/criteria.md).

Work through each category in order. Do not skip categories even if they seem unlikely to have issues.

### Step 3: Structure the output

```
## Summary
[2-3 sentence overview and overall assessment]

## Blocking Issues
[Issues that must be fixed: security vulnerabilities, logic errors, data loss risks. If none, write "None found."]

## Suggestions
[Non-blocking improvements, numbered. Include where, why, and how to fix each.]

## Positive Notes
[What the code does well. Always include at least one.]
```
```