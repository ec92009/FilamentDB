# Codex Review - 2026.05.02

## Architecture

- FilamentDB is still pleasantly direct: a TSV-backed data layer in `filament_db.py`, a PySide6 desktop shell in `filament_db_gui.py`, and a small macOS build helper.
- The main risk is concentration. `filament_db_gui.py` is 842 lines and `filament_db.py` is 746 lines, so GUI state, storage rules, CLI behavior, and TD1 scanner support are all becoming harder to change safely.
- Practical next step: extract low-risk helpers first, such as scanner/device code and custom Qt table/swatch widgets, before attempting a larger package split.

## UI

- The desktop surface has the right tool shape: searchable table, editable detail form, color swatch, and visible version badge.
- Numeric sorting and scan threading are useful quality details that should be preserved.
- The UI would benefit from a clearer separation between inventory editing, scanner status, and build/version state, but that should come after the current data workflow stays stable.

## UX

- TSV storage remains a good fit for a single-user filament catalog because it is inspectable, backup-friendly, and easy to repair.
- Hardware scanning runs off the UI thread, which protects the main workflow from device pauses.
- Error messages from scanner failures should keep their current user-friendly wording, but developer diagnostics would be stronger if tracebacks were logged somewhere local.

## Misc

- Existing local changes were present before this review: `data/filaments.tsv` and `2026.05.01_Claude_Review.md`.
- No code changes were made as part of this review.
- Suggested next low-risk task: add a tiny storage round-trip test around TSV read/write behavior.
