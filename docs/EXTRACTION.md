# Extraction scope and provenance

Source: `URunDEAD/fairphone6-nixos` (renamed `URunDEAD/nixos-fairphone6`; tag `lomiri-final`) main at `74aa719abaa7e0bacb36038627bf548d98e7523d` (2026-11-01 extraction). The original repository is untouched.

An exact file allowlist selected 162 paths before filtering history with git-filter-repo. One additional required baseline kernel config was copied byte-identically from the same pinned revision. Relevant commits retain original authorship and messages; rewritten commit IDs are mapped in `provenance/commit-map.txt`. Only the resulting main branch is published. The organization commit relocates components and adjusts relative recipe/config references; raw patches and driver logic are unchanged.

`provenance/files.json` maps all 163 retained source files to their current paths and records original/current SHA256 values and transformations. `provenance/excluded.json` accounts for every other file in the pinned 2,408-file tree. `provenance/allowlist.txt` records the history-filter input, not a future blanket publication rule.

## Exclusions

Exclude Lomiri/Mir, Phosh, apps, Qt desktop integration, Waydroid deployment, assistant/UI policy, complete NixOS targets, image/root assembly, private/local operations and reports. Keep only standalone hardware-facing libraries/helpers and their optional build recipes. No firmware blobs, boot images or user/device state are included.

Some original mixed files contain reusable knowledge but are not copied as active modules:

| Original area | Reason retained only upstream |
|---|---|
| `device/default.nix`, `device/nested-root.rb` | Firmware imports, fixed root layout and Android boot assembly mixed into the device definition |
| `hardware-fp6.nix`, `bluetooth-fp6.nix`, `torch-fp6.nix`, `sensors-fp6.nix` | System activation, identity/policy or desktop imports; extract narrow helpers in a future reviewed change if needed |
| Feature modules for battery, refresh rate, sensors, audio routing and connectivity | User policy, desktop hooks and system service wiring; relevant kernel patches are retained |
| Camera GStreamer application plugin | Application capture/job integration; libcamera patches and independent sensor tuning are retained |
| Waydroid A810 packaging | Android-container build/deployment scope, separate from the generic Mesa compatibility patch |
| ACDB-derived topology graphs | Vendor-derived data needs distinct redistribution review; source tools are retained |
| Phone test/flash/SSH scripts | Operational assumptions and deployment are out of scope; no device action is performed |

Hardware facts in the original device definition identify Fairphone Gen. 6, SM7635, AArch64 and a 1116×2484 display. The original configuration models Android A/B partitions and custom boot-image handling. These are reference facts, not a supplied boot/install procedure or a recovery guarantee.

## Checks

Validation reports belong in `provenance/validation.json`. Checks cover retained source hashes, changed-path scope, reference availability, syntax and generic privacy patterns. They do not compile or run components and cannot establish hardware readiness. Private report files stay outside the repository. Keep all existing GitLab projects and their visibility unchanged; this new subgroup/project are private initially.
