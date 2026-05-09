# FilamentDB Codex Review 2026-05-07

Reviewed at: 2026-05-07 00:00 Europe/Madrid

1/ General architecture:
- The project is still intentionally small, but `filament_db.py` and `filament_db_gui.py` are now both large enough to hide separate responsibilities. Split storage/import/export, TD1 capture, validation, and GUI controller concerns into modules before the next feature wave.
- Keep the TSV model, but define the row schema in one shared place so CLI, GUI, export, and legacy SQLite import cannot drift.
- Add a small service layer between PySide widgets and the persistence functions so duplicate detection and merge workflows can be implemented once.

2/ UI:
- Preserve the compact desktop table, but add stronger visual states for unavailable filaments, unrecognized filament types, and measured-vs-derived color values.
- The color-editing path would benefit from a side panel or inline inspector that shows hex, swatch, source, TD, and notes together.
- Keep the visible version badge, but consider also exposing the active data file path in an unobtrusive status area for sync/debug confidence.

3/ UX:
- Prioritize duplicate detection around brand/type/name/color before imports grow the catalog.
- Add an import preview with row-level warnings instead of importing first and asking the user to clean up afterward.
- For TD1 capture, make the failure states more explicit: no device, unreadable serial output, invalid measurement, and duplicate measurement should feel different.

4/ Testing:
- Add focused tests for TSV round-trips, type validation, legacy SQLite import, duplicate candidate detection, and export column stability.
- Add a minimal GUI smoke test for launching the table model and editing a row without touching a real serial device.
- Use fixture TSV files to lock down migrations and avoid accidental format drift.

5/ Everything else:
- The checked-in `.venv`/generated paths make local review noisy. Confirm they are ignored and not accidentally committed.
- `README.md` and `PRD.md` are current and clear; the next useful doc would be a short data-format contract.
- Consider a small sample catalog fixture that is realistic enough to exercise duplicate, unavailable, and measured/source cases.

6/ My suggetions:
1. Extract a shared schema/service layer from `filament_db.py` and `filament_db_gui.py`.
2. Add TSV/import/export tests with realistic fixture files.
3. Implement duplicate detection plus an import preview workflow.
4. Add measured-vs-derived provenance UI in the row inspector.
5. Document the TSV contract and supported validation rules.
