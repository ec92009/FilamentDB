# FilamentDB Codex Review 2026-05-19

Timestamp: 2026-05-19 02:02:56 CEST

1/ General architecture

- TSV as the canonical store is a good fit for a local-first maker library.
- The CLI/GUI split is healthy, but shared validation/import/export logic should remain outside GUI code so future tools can reuse it.
- Legacy SQLite migration support is valuable, but it should stay bounded and test-covered so the project does not maintain two real storage models.

2/ UI

- The denser PySide table and visible version badge fit the day-to-day maintenance workflow.
- Manual color correction needs strong affordances around hex validity, scanned-vs-manual provenance, and save/cancel outcomes.
- Duplicate/merge flows will need careful UI because they can damage the trusted library faster than normal edits.

3/ UX

- The product promise is clear: one trustworthy personal filament catalog.
- Type validation is a useful guardrail, but users need clear bypass wording for unusual materials.
- Import paths should emphasize preview before mutation so bulk changes remain reversible.

4/ Testing

- Add focused tests for TSV read/write round trips, type validation bypasses, duplicate detection, and legacy SQLite migration.
- GUI tests can stay light, but model/service tests should carry most confidence.
- Include sample malformed TSV rows to prevent silent data loss.

5/everything else

- README and PRD are strong and outsider-readable.
- The current roadmap is practical; duplicate detection and provenance labels should come before broad vendor ingestion.
- Keep build/version automation reliable because this is a desktop app users may launch outside the terminal.

6/ My suggetions:

1. Move all validation and mutation rules into a small service layer shared by CLI and GUI.
2. Add duplicate detection with a preview-only merge plan before any write path.
3. Add provenance fields or labels for scanned, imported, derived, and manually corrected values.
4. Expand tests around TSV corruption, legacy migration, and unusual filament types.
5. Add an importer preview workflow for personal/vendor datasets.
