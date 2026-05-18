# FilamentDB Codex Review 2026-05-17

Reviewed: 2026-05-17 02:04

1/ General architecture:
- The TSV-first data model is a good fit for Git-friendly material libraries, but persistence, validation, and GUI behavior still appear tightly coupled across the main scripts.
- A small domain layer around filament records, imports, duplicate detection, and validation would make CLI and GUI behavior easier to keep consistent.
- The macOS app workflow is well documented, but it increases release risk unless build/version/relaunch steps are automated and tested.

2/ UI:
- The denser table and visible build badge support day-to-day desktop use.
- Type validation warnings are helpful, but the GUI should distinguish warning, blocking error, and editable override states more visibly.
- Duplicate/merge flows will need careful UI because filament libraries often contain near-identical brand/type/name/color rows.

3/ UX:
- The current workflow favors local ownership and editability, which matches the project goal.
- Users need clearer provenance: measured TD1, imported vendor data, estimated values, and manual corrections should not feel equivalent.
- Import and merge operations should be reversible or previewed before mutation.

4/ Testing:
- Add CLI tests around temp TSV files for init/add/list/export/import and validation warnings.
- Add pure tests for duplicate matching and merge decisions before adding GUI affordances.
- A lightweight GUI smoke test can verify launch, table population, edit/save, and version badge visibility without exercising the whole app bundle.

5/ Everything else:
- The repo is ahead of origin, so GitHub handoff remains incomplete.
- Generated local worktrees/environments should be kept out of the source view or documented as intentional.
- README and PRD are strong enough to support outsider onboarding; keep them updated when workflow semantics change.

6/ My suggetions:
1. Extract a `filament_store` module for record parsing, persistence, validation, and export.
2. Add duplicate-detection tests and a previewable merge plan before building merge UI.
3. Add provenance fields or badges for measured, imported, estimated, and corrected values.
4. Add temp-file CLI tests for TSV init/add/list/export and warning paths.
5. Reconcile and push the local commits so the remote reflects the working state.
