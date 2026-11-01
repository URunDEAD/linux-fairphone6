# Fairphone 6 hardware support

Reusable **Linux** hardware-enablement work for Fairphone (Gen. 6), Qualcomm SM7635/Milos. Extracted from [fairphone6-nixos](https://github.com/URunDEAD/fairphone6-nixos) at `74aa719abaa7e0bacb36038627bf548d98e7523d`.

This is a component source collection, **not an OS image or a ready-to-install hardware module**. It has no Lomiri/Mir desktop, applications, session integration, complete NixOS configuration or deployment scripts. It is independent of Velrune. Linux drivers and ALSA/libcamera support can be reused across Linux distributions; other kernels need their own ports.

The GitLab project is private initially, with content curated for potential public release. No firmware binaries, calibration dumps, boot images, credentials or private logs are included. Do not add those later without checking redistribution rights and privacy.

## Layout

| Directory | Contents |
|---|---|
| [kernel](kernel/) | Kernel recipes/configs, driver patches, candidate series and upstream-oriented series |
| [drivers](drivers/) | Experimental S5KKD1 front-camera driver and diagnostic variant; firmware integrity constants and extraction source |
| [device-tree](device-tree/) | Preserved preprocessed camera DT candidate and historical compile recipe; small camera DTS include lives with the driver |
| [userspace](userspace/) | ALSA UCM, libcamera/tuning, modem/IMS, GNSS, fingerprint and call-audio helpers |
| [compatibility](compatibility/) | Mesa, PipeWire, GeoClue and Mobile NixOS compatibility patches |
| [tools](tools/) | Source-only audio calibration inspection/extraction tools; no calibration payloads |
| [docs](docs/) | Reuse, maturity, licensing and extraction boundaries |
| [provenance](provenance/) | Original revision, per-file hashes, path mappings, history map and exclusions |

Read [reuse and dependencies](docs/REUSE.md), [status](docs/STATUS.md), [licensing](docs/LICENSING.md) and [extraction scope](docs/EXTRACTION.md) before consuming components.

## Multi-phone organization

`urundead-labs/linux-handsets` holds one repository per phone. This project is `fairphone6`. Keep compatible board patches, configs and userspace support together. When another phone actually shares code, extract that component to an appropriately named shared repository and pin it from each phone project; do not duplicate moving copies or pre-create empty repositories.

Build-only Nix recipes accompany hardware components as optional tooling. Consumers supply their own OS packaging, boot assembly, service activation, security policy and desktop. No imports of the original complete system are required or supplied here.

## Validation boundary

The extraction verifies source provenance, retained history, privacy patterns and source syntax. It does not compile kernels, run hardware helpers, access a phone, load drivers, flash partitions or establish new hardware readiness. Old comments and series notes retain their original validation scope; they are not new acceptance results. See [status](docs/STATUS.md).
