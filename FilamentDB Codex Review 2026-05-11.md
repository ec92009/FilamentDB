# FilamentDB Codex Review 2026-05-11

Review time: 2026-05-11 02:05 CEST.

1/ General architecture

- The TSV-first data model is a strong fit for a personal filament library: Git-friendly, inspectable, and easy to recover.
- The CLI and desktop GUI appear to share the same core module, which is the right boundary. Keep pushing validation, parsing, duplicate detection, and import/export behavior into shared code rather than GUI callbacks.
- The project is still concentrated in a few top-level Python files. That is acceptable at this size, but duplicate detection/import/provenance work will benefit from a small package layout.

2/ UI

- The compact table and visible build badge support daily desktop use.
- The material type warning is useful, but the GUI should eventually distinguish hard validation errors from soft "unknown material family" warnings.
- Color correction through hex edits and swatches is practical; duplicate/merge UI is the next missing maintenance surface.

3/ UX

- The main workflow is clear: scan, review, correct, and maintain stock status.
- Users will need confidence about data provenance. Rows should make measured, imported, estimated, and sample values visually distinct.
- The README's "archive or delete older filaments.db" note should become an in-app migration status/check so users do not need to remember it.

4/ Testing

- No test files were present in the repo root scan. Core TSV parsing, add/edit/delete, availability changes, type validation, import migration, and CSV export need coverage before the library grows.
- GUI smoke testing can stay light, but the underlying model operations should be deterministic and testable without macOS UI automation.
- Add fixture-based tests for malformed TSV rows and serial TD1 parse failures.

5/ Everything else

- The README is strong and outsider-readable.
- The repo contains generated Python cache files in the working tree. Keep caches ignored and remove tracked artifacts if any were committed historically.
- Build/ship automation exists; keep it reserved for actual app changes, not review-only docs.

6/ My suggetions:

1. Add unit tests around TSV load/save, CLI CRUD, availability toggles, and CSV export.
2. Add duplicate detection with a merge preview keyed by brand, type, name, color, and source.
3. Add row provenance labels for measured, imported, sample, and manual entries.
4. Turn the old SQLite migration warning into a visible one-time app status.
5. Refactor shared model/storage code into a small package once tests are in place.
