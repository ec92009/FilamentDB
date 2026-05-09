# FilamentDB Codex Review 2026-05-08

Generated: 2026-05-08 00:00 Europe/Madrid

1/ General architecture

- The project is still pleasantly small, but `filament_db.py` and `filament_db_gui.py` carry most responsibilities. The next architecture gain is to isolate the TSV repository, validation rules, serial capture, and GUI state into explicit modules before new import/merge workflows arrive.
- The TSV-first data model is a good Git-friendly choice. Add a tiny migration/provenance layer now so future measured-vs-derived color values and duplicate merges do not become one-off scripts.

2/ UI

- The desktop GUI is clear for a local tool, especially with the visible build badge and denser table. The next UI need is stronger editing affordance: changed fields, validation warnings, and save/cancel state should be visually obvious before a row is committed.
- Color swatches should expose enough contrast and text labels to stay useful for very light, transparent, or near-black filaments.

3/ UX

- Importing existing filament libraries and resolving duplicates are still the main user journey gaps. A guided import preview with conflicts, detected duplicates, and reversible merge decisions would make the tool feel safer.
- TD1 capture should show device state, last sample time, and capture failures in the same workflow where the user edits the filament row.

4/ Testing

- There are no visible test files. Start with focused unit tests for TSV load/save, schema normalization, type validation, availability handling, duplicate detection, and CSV export.
- Add a small golden TSV fixture so future GUI and CLI changes cannot silently rewrite columns or optional fields.

5/ Everything else

- Keep the README/PRD outsider-facing and avoid letting review notes become the only source of roadmap truth.
- The build and Dock workflow is well documented, but it would benefit from a smoke-test command that verifies the CLI, sample data, and GUI import path without manual clicking.

6/ My suggetions:

1. Add a `tests/` suite for TSV round-trip, validation, duplicate detection, and export behavior.
2. Split storage/validation/serial capture out of the GUI file before adding larger import or merge features.
3. Build an import preview that reports new rows, duplicates, conflicts, and skipped rows before writing.
4. Add visible GUI dirty-state, validation-state, and save/cancel affordances for row edits.
5. Add a documented smoke-test command that runs before app packaging.
