---
name: log-analyzer
description: Analyzes application log files to identify errors and patterns. Use when the users says "check the logs", "what errors are in my logs", or "analyze this log file".
allowed-tools: Read, Grep, Glob
---

# Log Analyzer

1. Use Glob to find log files: *.log, logs/*.log, /var/log/*.log
2. Use Grep to search for error patterns: ERROR, FATAL, Exception, Traceback
3. Group errors by type and frequency
4. Summarize with the most frequent errors first
