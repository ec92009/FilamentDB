# FilamentDB Codex Review 2026-05-12

Reviewed: 2026-05-12

1/ General architecture

- The project has a clear local-first architecture: a TSV source of truth, a CLI module, and a PySide desktop GUI.
- `filament_db.py` and `filament_db_gui.py` are both large enough that the data model, validation, serial capture, and UI concerns should be separated before more workflows are added.
- The TSV storage choice is pragmatic and Git-friendly. Keep it as the persistence layer unless multi-user writes become a real requirement.
- The automatic legacy DB import path is helpful, but it should be time-boxed and documented as migration-only behavior so the code does not carry it indefinitely.

2/ UI

- The GUI appears tuned for practical library maintenance: dense table, visible build badge, direct editing, and warning on unknown material families.
- The next UI improvement should be duplicate/merge review, because that is likely where real filament libraries get messy.
- Swatches, availability state, and source/provenance should be visible enough that users can trust the catalog at a glance.
- Serial TD1 capture needs clear success/failure status and a way to attach a reading to the currently selected row without ambiguity.

3/ UX

- The workflow is understandable: initialize, edit/import, browse, capture TD, export.
- The highest UX risk is accidental data corruption in the TSV. Users need confidence around validation, backups, undo, and duplicate handling.
- Import flows should preview changes before writing, especially when merging outside libraries.
- Availability should be treated as a filterable state, not merely a saved field.

4/ Testing

- No tests were visible in the repo root scan.
- Add unit tests for TSV parsing/writing, schema migration, duplicate detection, validation, and CSV export before expanding the GUI.
- Add small GUI smoke tests around table load, edit-save, unavailable filtering, and TD capture error states if PySide test tooling is already acceptable.
- Golden TSV fixtures would make regression testing cheap and valuable.

5/ Everything else

- The repo has an untracked `.DS_Store`; add or enforce ignore rules and clean local metadata.
- README and `pyproject.toml` are aligned around local TSV storage and PySide, which is good.
- If LeadLight depends on this data, document the exact compatibility contract between the projects.

6/ My suggetions:

1. Add a focused pytest suite for TSV load/save, validation, CSV export, and duplicate detection.
2. Extract a small data/service layer from `filament_db.py` so CLI and GUI share one tested API.
3. Build a duplicate review and merge workflow before growing import support further.
4. Add a write-safety path: timestamped backup before save, import preview, and clear validation errors.
5. Document the FilamentDB-to-LeadLight data contract, including required columns and material-family naming.
6. Clean `.DS_Store` from the repo and confirm `.gitignore` prevents recurrence.
