# FilamentDB

FilamentDB is a local filament library for people who want a clean, editable record of real 3D printing materials and their measured color data.

It stores filament entries in a Git-friendly TSV file, provides a command-line interface for quick edits and exports, and includes a small desktop GUI for browsing, scanning, and correcting filament records on macOS.

## What FilamentDB Does

- keeps a local catalog of filaments with brand, filament type, color name, hex color, and TD value
- stores data in `data/filaments.tsv` so the library stays portable and easy to sync
- supports direct TD1 capture from macOS serial devices
- lets you review and edit records from either the CLI or the GUI
- exports the library to CSV for use in other tools and workflows
- shows a visible build badge in the desktop app so you can confirm which local version is running
- opens with a compact table layout that favors showing about ten rows before scrolling

## Where FilamentDB Is Going

FilamentDB is moving toward becoming a practical source of truth for real printable filament libraries: measured where possible, easy to maintain by hand, and straightforward to reuse from other local tools such as color-planning or print-prep apps.

Near-term direction:

- stronger duplicate detection and merge workflows
- easier import paths for existing filament libraries
- better provenance around measured vs. derived values
- continued refinement of the desktop app for day-to-day library maintenance

## Current Scope

- local TSV library
- command-line CRUD workflow
- desktop GUI for browsing and editing records
- visible top-right build badge in the desktop GUI
- denser default table layout with roughly ten visible rows
- optional starter sample rows
- direct TD1 capture from macOS serial output

## Data Model

Each filament row centers on a simple, practical set of fields:

- `brand`
- `type`
- `name`
- `color`
- `td`

Optional support fields:

- `source`
- `notes`

Internally, the stored column name is `filament_type` to avoid `type` awkwardness in the code, but the CLI and exported shape are presented as `type`.

## Getting Started

Initialize the local database:

```bash
cd /path/to/FilamentDB
uv run python filament_db.py init
```

The active library lives in `data/filaments.tsv` inside this repo. If an older `data/filaments.db` exists in the same checkout, FilamentDB will import it automatically the first time the TSV is empty.

After you confirm the TSV contains the expected rows, archive or delete any leftover `filaments.db` files so the TSV becomes the only active source of truth.

Launch the desktop GUI:

```bash
cd /path/to/FilamentDB
uv run python filament_db_gui.py
```

Build the macOS app bundle:

```bash
cd /path/to/FilamentDB
./build_filamentdb_app.sh
```

That creates `dist/filamentDB.app`.

## Common CLI Commands

Seed a small starter sample set:

```bash
uv run python filament_db.py seed-samples --replace
```

Add a filament manually:

```bash
uv run python filament_db.py add \
  --brand SUNLU \
  --type "PLA Matte" \
  --name "Matte Red" \
  --color "#C62828" \
  --td 5.6 \
  --source td1 \
  --notes "Measured on BIQU TD1"
```

List all filaments:

```bash
uv run python filament_db.py list
```

Search by free text:

```bash
uv run python filament_db.py search matte
```

Show one record:

```bash
uv run python filament_db.py show 1
```

Delete one record:

```bash
uv run python filament_db.py delete 1
```

Export to CSV:

```bash
uv run python filament_db.py export-csv out/filaments.csv
```

Capture one filament directly from the connected TD1:

```bash
uv run python filament_db.py scan \
  --brand SUNLU \
  --type "PLA+ 2.0" \
  --name "Coffee"
```

If needed, point it at a specific serial device:

```bash
uv run python filament_db.py scan \
  --brand SUNLU \
  --type "PLA+ 2.0" \
  --name "Coffee" \
  --device /dev/cu.usbmodem21101
```

## GUI Workflow

The desktop GUI wraps the same library and scan workflow:

- choose or type `brand`
- choose or type `type`
- choose or type `name`
- confirm the running build from the version badge in the top-right corner
- press `Scan from TD1` while the filament is in the TD1
- save the measured `TD` and `HEX` directly into the local library
- review the swatch next to the saved `HEX`
- correct the color by typing a new hex value or double-clicking the swatch
- browse the full table with row swatches, sorting, search, and a denser default row height
- double-click a row to load it back into the editor
- save edits to brand, type, name, notes, and color
- delete selected rows when they are no longer needed

On macOS, the table follows native natural scrolling behavior instead of a custom inverted scroll model.

## Sample Data

The seeded sample rows are intentionally conservative. They exist as starter placeholders, are labeled with `source=sample`, and leave `td` blank until you measure or import trustworthy values.

The current starter set includes:

- `SUNLU PLA Matte`: Black, White, Red, Blue, Green
- `SUNLU Transparent PLA`: Blue, Red, Green, Yellow, Clear, Purple
