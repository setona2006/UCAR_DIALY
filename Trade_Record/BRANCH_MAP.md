# BRANCH_MAP

## Policy
- main is the canonical record for ops (STATUS / weekly logs / index).
- Branches are used only for: refactors, schema changes, monthly extraction packs, automation PoC.

## Active
- main: canonical ops + weekly records

## Naming Conventions
- trade-gm-YYYY-MM: monthly extraction / distilled pack
- schema-*: meta.yaml / tags / folder rules changes
- mcp-*: MCP / automation experiments
- fix-*: one-off repair work

## Merge Rules
- Prefer PR -> main for non-trivial changes.
- Do not rewrite history on main.
