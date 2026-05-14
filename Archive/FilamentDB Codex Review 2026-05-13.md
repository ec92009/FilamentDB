# FilamentDB Codex Review 2026-05-13

Reviewed: 2026-05-13

1/ General architecture

- FilamentDB has a clear local-first architecture: TSV data source, CLI workflows, and a PySide desktop GUI.
- The persistence choice is pragmatic and Git-friendly. Keep the TSV as the source of truth unless real concurrent editing becomes necessary.
- `filament_db.py` and `filament_db_gui.py` are both large enough that data access, validation, import/export, serial capture, and GUI orchestration should be separated before the next major workflow.
- The legacy DB import path is useful, but it should be explicitly treated as migration-only behavior so it does not become permanent complexity.

2/ UI

- The GUI is aimed at practical catalog maintenance: dense table, visible build badge, editable rows, availability state, and material-family warnings.
- Duplicate review and merge affordances should become the next high-value UI improvement because real filament libraries will accumulate near-duplicates.
- Swatches, availability, source, and notes should be visible enough to judge trust at a glance.
- TD1 capture needs unambiguous status: device found, read succeeded, read failed, and which row will receive the value.

3/ UX

- The workflow is understandable: initialize, maintain records, capture measurements, and export.
- The main UX risk is accidental TSV corruption. Users need backups, validation errors, import previews, and a clear undo/recovery path.
- Availability should behave as a first-class filter, not only a saved yes/no field.
- If LeadLight consumes this data, users should not have to guess which columns and material-family names are compatible.

4/ Testing

- No formal test suite is visible in the root scan.
- Add unit coverage for TSV load/save, schema migration, validation, duplicate detection, CSV export, and legacy DB import behavior.
- GUI tests can stay small but should cover app launch, table load, edit-save, unavailable filtering, and TD capture error states.
- Golden TSV fixtures would give the project cheap regression protection.

5/ Everything else

- A local `.DS_Store` is still present; confirm ignore rules and clean metadata before committing unrelated work.
- README and `pyproject.toml` are aligned on the product direction and PySide dependency.
- Document the FilamentDB-to-LeadLight contract if the two projects are meant to share material data.

6/ My suggetions:

1. Add pytest coverage for TSV parsing/writing, validation, CSV export, duplicate detection, and migration-only DB import.
2. Extract a small data/service layer so CLI and GUI share one tested API.
3. Build a duplicate review and merge workflow before expanding imports.
4. Add write-safety features: timestamped backup before save, import preview, and specific validation messages.
5. Document and test the data contract used by LeadLight.
6. Clean `.DS_Store` and confirm `.gitignore` prevents local metadata from returning.
