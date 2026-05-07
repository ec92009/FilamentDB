# FilamentDB Codex Review 2026-05-06

Timestamp: 2026-05-06 02:02 CEST

## 1/ General architecture

- Keep leaning into the TSV source-of-truth model; it fits the project and keeps sync/debugging simple.
- Split the shared validation/import/export rules out of the GUI and CLI entrypoints into a small service module so every pathway treats filament type, availability, TD values, and duplicate detection the same way.
- Add a lightweight migration/check command for the TSV schema so future optional fields can be introduced without hand-editing data files.
- Treat TD1 serial capture as an adapter boundary with recorded fixtures; that will make hardware-less testing much easier.

## 2/ UI

- The desktop GUI should make duplicate/near-duplicate rows visually obvious before save, especially same brand/type/name with different TD or color.
- Add clearer empty/loading/error states around TD1 capture so the app never feels stuck when a serial device is absent or noisy.
- Keep the compact table, but add small filter chips for available/material family/source to reduce scrolling as the catalog grows.

## 3/ UX

- Add an import wizard that previews added, changed, and skipped rows before touching `data/filaments.tsv`.
- Give users a one-click "mark unavailable" workflow from selected rows; deletion should remain a secondary action.
- Add provenance language in the UI for measured vs. manually entered colors so users know which records are most trustworthy.

## 4/ Testing

- Add pytest coverage for TSV round-trips, malformed rows, duplicate detection, and import-from-old-db behavior.
- Add GUI smoke tests around table load, edit, save, and warning dialogs using Qt test helpers where practical.
- Record sample TD1 serial lines and test parser behavior against them.

## 5/ Everything else

- Keep `README.md` and `PRD.md` aligned with the current TSV-first direction; the README is already clear and should stay outsider-facing.
- Consider adding a small `docs/data-format.md` once the TSV fields stabilize.
- Ignore/generated app bundles and screenshots should stay out of normal review paths unless they are release artifacts.

## 6/ My suggetions:

1. Extract shared filament validation and TSV persistence into a non-GUI service module.
2. Add pytest coverage for TSV load/save, validation warnings, duplicate detection, and old DB import.
3. Build a preview-first CSV/TSV import flow with added/changed/skipped counts.
4. Add GUI affordances for duplicate rows, unavailable inventory, and TD1 connection errors.
5. Document the TSV schema and measured-vs-manual provenance rules.
