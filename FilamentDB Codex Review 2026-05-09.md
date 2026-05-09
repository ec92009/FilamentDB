# FilamentDB Codex Review 2026-05-09

Generated: 2026-05-09 00:00 Europe/Madrid

1/ General architecture

- The repo remains compact, but `filament_db.py` and `filament_db_gui.py` are both well past the size where storage, validation, TD1 capture, and UI state should keep living together. Split those seams before importer or merge logic lands.
- The TSV source of truth is still the right architectural bet. Add explicit schema/provenance handling now so measured, imported, corrected, and derived color values do not become ambiguous later.

2/ UI

- The desktop app has the right local-utility posture. The next useful polish is stronger row-edit feedback: dirty state, validation warnings, and a clear commit/cancel path before writing to TSV.
- Color swatches should be paired with readable labels and contrast handling for translucent, white, black, and near-neutral filaments.

3/ UX

- Duplicate handling is the biggest trust gap. Users need an import/merge preview that shows exact incoming rows, likely duplicates, conflicts, and skipped records before any write.
- TD1 capture should feel integrated with editing: device status, latest sample timestamp, parse errors, and raw reading should be visible near the row being created.

4/ Testing

- No test files are visible. Start with storage tests around TSV round-trip, schema normalization, availability flags, type validation, search, delete, and CSV export.
- Add golden fixture TSVs so CLI and GUI changes cannot silently reorder columns or drop optional fields.

5/ Everything else

- The app build/Dock workflow is documented, but a non-interactive smoke command would make handoff safer.
- Keep `README.md` and `PRD.md` as the public product record; daily review files should feed the backlog, not replace it.

6/ My suggetions:

1. Add `tests/` for TSV round-trip, validation, availability, search/delete, and CSV export.
2. Extract storage, validation, serial capture, and GUI orchestration into separate modules.
3. Build an import preview with duplicate/conflict detection before writes.
4. Add GUI dirty-state, validation-state, and save/cancel affordances.
5. Add a documented smoke command for CLI, sample data, and package readiness.
