# FilamentDB Codex Review 2026-05-15

1/ General architecture:
- The app is still compact, but `filament_db_gui.py` and `filament_db.py` are large enough that GUI event handling, TD1 capture, data validation, and persistence should be separated more deliberately.
- The TSV data model remains pragmatic and Git-friendly. The next architectural improvement should be service-layer functions around duplicate detection, imports, and provenance rather than more GUI-local logic.

2/ UI:
- The desktop table-first UI fits the product. Keep prioritizing dense editing workflows over decorative UI.
- Add a clearer duplicate/merge review surface before import volume grows; this will matter more than cosmetic table changes.

3/ UX:
- The warning path for unknown material families is a good start. Users also need explicit confidence/provenance cues for measured vs. entered vs. imported values.
- Import and merge workflows should preview changes before writing to `data/filaments.tsv`.

4/ Testing:
- No test files were found. Add focused tests around TSV load/save, material validation, availability handling, TD parsing, and duplicate detection.
- Add one non-GUI integration test that exercises create/edit/export on a temporary TSV file.

5/ Everything else:
- Build artifacts under `build/` and `dist/` are present, which is expected for this macOS app, but avoid reviewing generated bundles as source.
- The README and PRD remain useful from an outsider perspective; update them whenever duplicate/import behavior changes.

6/ My suggetions:
1. Extract persistence and validation from the GUI into testable service functions.
2. Add tests for TSV round-trips, material validation, and availability edits.
3. Define provenance fields and UI labels for measured/imported/manual values.
4. Design a duplicate merge preview flow before adding bulk imports.
5. Keep build artifacts out of architectural decisions and document the source-only workflow.
