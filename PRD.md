# Product Requirements Document

## Product

FilamentDB

## Summary

FilamentDB is a local-first filament library for tracking real 3D printing materials, especially when measured color and TD data matter. It combines a human-editable TSV data store with a lightweight CLI and desktop GUI so a single user can build and maintain a trustworthy personal filament catalog.

## Problem

Filament information is often scattered across spool labels, slicer presets, handwritten notes, and one-off measurements. That makes it hard to answer basic workflow questions reliably:

- which filament was actually measured
- what TD value belongs to a specific spool or color
- whether a stored color is scanned, estimated, or manually corrected
- which local file should be treated as the current source of truth

FilamentDB exists to replace that mess with one practical, portable library.

## Target User

The primary user is an individual maker maintaining a personal filament collection across one or more local machines.

That user needs to:

- record real filament metadata quickly
- capture TD1 readings when hardware is available
- correct colors by hand when the scan is imperfect
- keep the library easy to inspect, sync, and reuse from other local tools

## Product Goals

- provide one local source of truth for filament records
- keep the storage format easy to edit, diff, and sync
- make measured filament data faster to capture than ad hoc note-taking
- support both scriptable and GUI-driven maintenance
- stay simple enough to use regularly instead of becoming another abandoned database

## Non-Goals

- multi-user cloud sync
- enterprise inventory management
- slicer-profile management for every printer setting
- automatic vendor catalog ingestion at broad marketplace scale

## Core Experience

1. Create or open a local FilamentDB checkout.
2. Initialize the TSV-backed library.
3. Add filaments manually or scan them from a TD1 device.
4. Review the saved row in the GUI table or CLI output.
5. Correct color, notes, or naming as needed.
6. Export or reuse the library from downstream print-planning workflows.

## Current Functional Requirements

- Store filament rows in `data/filaments.tsv`.
- Support create, list, search, show, delete, and export operations from the CLI.
- Support seeding a small starter sample set.
- Support TD1 scan capture from macOS serial output.
- Support browsing, sorting, searching, editing, and deleting rows in the GUI.
- Support manual color correction through typed hex input and swatch-driven editing.
- Show a visible build version badge in the desktop app so the running local build is easy to identify.
- Default the desktop table view to a denser layout that shows about ten rows before scrolling.
- Preserve compatibility with older local SQLite data by importing legacy `filaments.db` into TSV when needed.
- Validate filament type against known material families (PLA, PETG, TPU, ABS, ASA) before saving; if the type is unrecognized, warn the user and let them modify or bypass the check.

## Product Principles

- local-first over cloud-first
- editable plain-text data over opaque storage
- measured values over guessed values when available
- practical daily usability over feature sprawl
- clear provenance over silent assumptions

## Near-Term Roadmap

- duplicate detection and safer merge workflows
- importers for existing personal or vendor datasets
- clearer provenance labels for scanned, derived, imported, and manually corrected values
- continued polish for the desktop editing flow

## Success Criteria

- the user can maintain the full active filament library in one place
- measured TD and color data are easier to capture and revisit than before
- the TSV file remains trustworthy enough to treat as the canonical local dataset
- downstream tools can rely on FilamentDB instead of hard-coded material assumptions
