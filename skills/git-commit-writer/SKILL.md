---
name: git-commit-writer
description: Generates standardized git commit messages following conventional commit specs. Use when the users asks to "write a commit message", "help me commit", "summarize my changes", "what should my commit say", or "draft a commit". Analyzes staged diffs and change descriptions to produce type(cope): description format messages.
---

# Git Commit Writer

## Format

```
type(scope): short description

[optional body]

[optional footer]
```

## Types

- feat: new feature
- fix: bug fix
- docs: documentation
- style: formatting, missing semi-colons, etc.
- refactor: refactoring
- perf: performance improvement
- test: tests
- build: build system or external dependencies
- ci: CI configuration or scripts
- chore: maintenance

## Instructions

### Step 1: Get the diffs

```bash
git diff --staged
```

If nothnig is staged:

```bash
git diff HEAD
```

### Step 2: Analyze the changes

Look for:
- What files changed and what category they belong to
- Whether this adds new functionality (feat), fixes a bug (fix), improves performance (perf), or updates docs/config/tests
- The scope: whic module, component, or area is affected


### Step 3: Write the commit message

- Keep the subject line under 72 characters
- Use imperative mood: "add feature" not "added feature"
- Do not end the subject line with a period
- Add a body if the change needs more context than the subject allows


### Step 4: Quality check

- [ ] Type is one of the allowed types
- [ ] Subject line is under 72 characters
- [ ] Imperative mood is used
- [ ] Subject does not end with a period
- [ ] Scope is specific enough to be useful

## Examples

```
feat(auth): add OAuth2 login with Google

Implements OAuth2 authentication flow using the existing session management system. Users can now sign in with their Google account.

Fixes #142
```

```
fix(api): handle null response from payment provider
```

```
docs(readme): update local setup instructions for Node 22
```
