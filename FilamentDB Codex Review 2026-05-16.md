# FilamentDB Codex Review 2026-05-16

Review timestamp: 2026-05-16 02:03 CEST.

1/ General architecture:
- TSV storage plus CLI plus PySide GUI is a good local-first shape for a personal filament library.
- The next architecture gain is to separate the domain model, file persistence, TD1 capture, and GUI adapters more sharply so core behavior can be tested without the desktop app.

2/ UI:
- The desktop table and version badge are practical for a maintenance app.
- Editing workflows would benefit from stronger visual distinction between measured, imported, estimated, and manually corrected values.

3/ UX:
- The core workflow is clear: record, browse, correct, export.
- Duplicate and merge flows are still the likely day-to-day friction once the catalog grows.

4/ Testing:
- The repo does not yet appear to have a focused tracked test suite for the TSV/domain layer.
- Add pure unit tests for row parsing, validation, duplicate detection, availability toggles, export shape, and legacy SQLite import.

5/ Everything else:
- Local worktree/cache clutter under tool folders can make audits noisy; keep generated environments ignored and outside the review surface.
- Versioning expectations are clear in `AGENTS.md`; keep GUI visible version and `pyproject.toml` aligned when behavior changes.

6/ My suggetions:
1. Extract a small `filament_store` domain/persistence layer with tests before expanding GUI features.
2. Add duplicate detection and a safe merge workflow for same brand/type/name/color rows.
3. Add provenance fields or UI badges for measured, imported, estimated, and corrected data.
4. Add CLI tests that exercise TSV init/add/list/export using temporary files.
5. Add a cleanup rule for local tool worktrees and generated virtual environments.
