Instructions for each iteration:
markdown
# Ralph Agent Instructions

## Your Task

1. Read `AGENTS.md`
2. Read `prd.json`
3. Read `progress.txt`
   (check Codebase Patterns first)
4. Check you're on the correct branch
5. Pick highest priority story 
   where `passes: false`
6. Implement that ONE story
7. Run typecheck and tests
8. Update AGENTS.md files with learnings
9. Commit: `feat: [ID] - [Title]`
10. Update prd.json: `passes: true`
11. Append learnings to progress.txt

## Progress Format

APPEND to progress.txt:

## [Date] - [Story ID]
- What was implemented
- Files changed
- **Learnings:**
  - Patterns discovered
  - Gotchas encountered
---

## Codebase Patterns

Add reusable patterns to the TOP 
of progress.txt:

## Codebase Patterns
- Migrations: Use IF NOT EXISTS
- React: useRef<Timeout | null>(null)

## Stop Condition

If ALL stories pass, reply:
<promise>COMPLETE</promise>

Otherwise end normally.
