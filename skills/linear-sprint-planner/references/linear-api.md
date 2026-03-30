# Linear API Patterns

## Fetching backlog
Paginate in batches of 50. Check pageInfo.hasNextPage and use the after cursor.
Filter for: status [Backlog, Todo], cycle: null.

## Creating a cycle
Required: name, startsAt, endsAt, teamId

## Adding issues
Use issueUpdate mutation to set cycleId. Batch where possible.

## Rate limiting
On 429: wait 1 second, retry once. If it fails again, report to user and continue.