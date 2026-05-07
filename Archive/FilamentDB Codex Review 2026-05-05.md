# FilamentDB Codex Review 2026-05-05

Generated: 2026-05-05 10:36:54 CEST

1/ General architecture

- The core data model is pleasantly simple: a Git-friendly TSV store, CLI operations, and a PySide GUI around the same file. That is the right shape for a small source-of-truth utility.
- `filament_db.py` still mixes CLI parsing, persistence, validation, TD1 scanning, formatting, and migration from the old SQLite path. Split the store and domain validation into a package module before adding import/export or duplicate merge workflows.
- The project includes generated app/build artifacts and `__pycache__` files in the working tree. Tighten ignore rules so the repo only carries source, docs, sample data, icons, and intentional release artifacts.

2/ UI

- The GUI has a clear desktop-app purpose, but the review should prioritize table ergonomics: fast filtering, visible availability state, duplicate warnings, and bulk mark-available/unavailable actions.
- Add a dedicated TD capture status panel that distinguishes "device not found", "waiting", "parsed scan", and "saved" states.

3/ UX

- The README explains the TSV model well. The next UX lift is workflow safety: preview changes before destructive deletes, show where the active TSV is stored, and make import/migration status obvious.
- For non-expert users, filament `type` validation should suggest close known families instead of only warning.

4/ Testing

- There are no visible tests. The store is simple enough to cover quickly with file-based unit tests for load/save, ID allocation, CSV export, type warnings, search, and legacy import.
- Add one CLI smoke test per command group before refactoring.

5/ Everything else

- Consider adding a tiny schema/version row or metadata comment in the TSV companion docs so future field changes are safer.
- Document whether `source` values are free-form or controlled.

6/ My suggetions:

1. Extract `FilamentStore`, record serialization, validation, and migration into a `filamentdb/` package.
2. Add pytest coverage for TSV round trips, commands, and legacy DB import.
3. Add GUI duplicate detection and safer delete confirmation.
4. Tighten `.gitignore` for caches and generated build/runtime files.
5. Add a TD1 capture troubleshooting section to the README.
