# FilamentDB Codex Review 2026-05-14

Review timestamp: 2026-05-14, Europe/Madrid.

1/ General architecture

- The TSV-first data model is a strong fit: portable, diffable, and easy to reuse from LeadLight or other print tools.
- CLI and GUI both target the same local library, but the repo still has a small-script shape; shared validation and data-access boundaries should stay explicit as features grow.
- The discovered `.claude/worktrees/.../.venv` footprint is large and should be audited so generated worktrees or virtualenvs do not become repo clutter.

2/ UI

- The desktop GUI direction is practical: dense table, visible build badge, and manual color correction suit day-to-day catalog maintenance.
- Color editing should show provenance clearly, distinguishing scanned, imported, estimated, and manually corrected values.
- Duplicate/merge workflows will need careful UI states before more import paths are added.

3/ UX

- The app solves a concrete workflow, but first-run onboarding should make the canonical `data/filaments.tsv` path and legacy SQLite import behavior obvious.
- TD1 scanning failures should produce specific guidance: missing device, bad serial output, permission issue, or parse failure.
- The user should never wonder whether a row is unavailable, deleted, duplicated, or superseded.

4/ Testing

- Add focused tests around TSV round-tripping, invalid material-family warnings, legacy DB import, duplicate detection, and export shape.
- GUI behavior can be smoke-tested through model/controller helpers without requiring full visual automation.
- Add a data fixture with unusual but realistic filament names, empty notes, bad TD values, and duplicate-ish rows.

5/ Everything else

- Versioning and release workflow are clearly documented, but review-only document changes should not force app-visible version bumps.
- `README.md` and `PRD.md` are outsider-friendly and should remain the canonical product explanation.
- Keep downstream LeadLight assumptions documented so the filament schema does not drift silently.

6/ My suggetions:

1. Audit and ignore/remove local `.claude` worktree virtualenv artifacts if they are not intentionally tracked.
2. Add TSV data-access tests for add, edit, delete, export, invalid values, and legacy import.
3. Design the duplicate-detection and merge workflow before adding broad importers.
4. Add provenance fields or UI labels for scanned, imported, estimated, and manual color data.
5. Improve TD1 error messages with actionable device/permission/parse diagnostics.
6. Add a small fixture library that downstream tools can use in tests.
