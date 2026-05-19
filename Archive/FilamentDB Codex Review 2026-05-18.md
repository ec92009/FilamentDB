# FilamentDB Codex Review 2026-05-18

Reviewed: 2026-05-18 00:00 Europe/Madrid

1/ General architecture:
- The TSV-first model is still a good match for a portable filament library, but CLI, validation, persistence, and GUI behavior need a clearer shared domain layer.
- `filament_db.py` and `filament_db_gui.py` carry too much cross-cutting behavior for duplicate detection, imports, validation, and edits to evolve safely.
- The macOS build workflow is useful but release-heavy; version/build/relaunch steps should stay scripted and testable.

2/ UI:
- The desktop table, compact layout, and visible version badge support practical daily use.
- Validation warnings should make severity clear: warning, blocking error, editable override, or accepted non-standard material.
- Duplicate and merge workflows will need a preview UI because brand/type/name/color rows will often be close but not identical.

3/ UX:
- The local-editable workflow fits the project goal well.
- Users need provenance on each TD/color value: measured, imported, estimated, or manually corrected should not feel equivalent.
- Imports and merges should be previewable and reversible before they mutate the TSV.

4/ Testing:
- Add temp-file CLI tests for init, add, list, export, import, and validation warning paths.
- Add pure duplicate/merge tests before adding GUI controls.
- Add a lightweight GUI smoke test for launch, table population, edit/save, and version badge visibility.

5/ Everything else:
- Existing review/archive changes from the prior run were present and should be reconciled with this run instead of duplicated.
- README and PRD are useful outsider-facing docs; keep them current when workflow semantics change.
- Generated build artifacts should stay out of the review surface unless intentionally tracked.

6/ My suggetions:
1. Extract a `filament_store` module for parsing, persistence, validation, import, and export.
2. Add duplicate-detection and merge-plan tests using temporary TSV fixtures.
3. Add provenance fields or badges for measured, imported, estimated, and corrected values.
4. Add a GUI smoke test for launch, table load, edit/save, and version badge visibility.
5. Commit and push the accumulated review/archive state so the remote is clean.
