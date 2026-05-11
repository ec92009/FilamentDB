# FilamentDB Codex Review 2026-05-10

Timestamp: 2026-05-10 02:04 CEST

1/ General architecture:

- The project is still refreshingly small, but the two main files (`filament_db.py` and `filament_db_gui.py`) now carry storage, validation, CLI, serial capture, and GUI concerns together. Splitting around those boundaries would make the app easier to test and safer to grow.
- The TSV-first model is a good fit. It needs a thin repository layer that owns schema migration, duplicate detection, and atomic writes so both CLI and GUI use the same rules.

2/ UI:

- The desktop table should keep moving toward explicit states: unsaved changes, invalid rows, serial-device connected/disconnected, and export/import success.
- The version badge is useful; the same top-level area could also show the active database path so users know which filament library they are editing.

3/ UX:

- Add an import preview before accepting CSV/TSV data. Users need to see duplicate candidates, invalid material families, and measured-vs-derived TD provenance before writes happen.
- Serial TD capture should have a guided "capture, review, attach to selected filament" path rather than feeling like a device-side side effect.

4/ Testing:

- There are no tests yet. Start with fast TSV round-trip tests for add/edit/delete/list/export, then add validation tests for material family and TD parsing.
- Add one GUI-adjacent smoke test that instantiates the model/controller layer without opening a full app window.

5/ Everything else:

- The README is clear, but `NEXT_STEPS.md` should be kept in sync or collapsed into one backlog to avoid competing planning surfaces.
- Document the old SQLite import path as a migration utility with expected one-time behavior and failure handling.

6/ My suggetions:

1. Extract a `FilamentStore` module that owns TSV loading, validation, duplicate detection, and atomic save.
2. Add pytest coverage for TSV round-trip, CSV export, material validation, and duplicate conflict cases.
3. Build an import-preview command first, then reuse it in the GUI.
4. Add GUI status indicators for dirty state, active DB path, and TD1 connection state.
5. Consolidate `NEXT_STEPS.md` into the README or a single `TODO.md` backlog.
