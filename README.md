# linux-fairphone6: Fairphone 6 hardware support

Reusable **Linux** hardware-enablement work for Fairphone (Gen. 6), Qualcomm SM7635/Milos. Extracted from the original all-in-one port (then `fairphone6-nixos`, now [nixos-fairphone6](https://github.com/URunDEAD/nixos-fairphone6), tag [`lomiri-final`](https://github.com/URunDEAD/nixos-fairphone6/tree/lomiri-final)) at `45d07cde3611922a8302a387f4cf392c1340725f`.

This is a component source collection, **not an OS image or a ready-to-install hardware module**. It has no Lomiri/Mir desktop, applications, session integration, complete NixOS configuration or deployment scripts. It is independent of Velrune. Linux drivers and ALSA/libcamera support can be reused across Linux distributions; other kernels need their own ports.

Content is curated for public release. No firmware binaries, calibration dumps, boot images, credentials or private logs are included. Do not add those later without checking redistribution rights and privacy.

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

## Related repositories

| Repository | Role |
|---|---|
| **linux-fairphone6** (this) | Linux hardware enablement: kernel, drivers, device tree, ALSA/libcamera, modem helpers |
| [nixos-fairphone6](https://github.com/URunDEAD/nixos-fairphone6) | Desktop-neutral NixOS / Mobile NixOS packaging, device modules and reference image; pins this repository |
| [lomiri-fairphone6](https://github.com/URunDEAD/lomiri-fairphone6) | Lomiri/Mir shell, Phosh and Ubuntu Touch apps on the NixOS port (the original full stack) |
| Velrune OS (private) | One consumer of the NixOS layer |
| [redox-fairphone6](https://github.com/URunDEAD/redox-fairphone6) | Redox OS bring-up on the same phone (experimental) |

Desktop-neutral NixOS packaging, device modules and reference configurations live in [nixos-fairphone6](https://github.com/URunDEAD/nixos-fairphone6). It pins this hardware source and does not select a desktop or app suite. Hardware patches remain here. Existing Nix recipes here remain reference/provenance material while maintained OS-facing packaging and activation belong there.

## Multi-phone organization

One hardware repository per phone, named `linux-<phone>`. This project is `linux-fairphone6`. Keep compatible board patches, configs and userspace support together. When another phone actually shares code, extract that component to an appropriately named shared repository and pin it from each phone project; do not duplicate moving copies or pre-create empty repositories.

Build-only Nix recipes accompany hardware components as optional tooling. Consumers supply their own OS packaging, boot assembly, service activation, security policy and desktop. No imports of the original complete system are required or supplied here.

## Validation boundary

The extraction verifies source provenance, retained history, privacy patterns and source syntax. It does not compile kernels, run hardware helpers, access a phone, load drivers, flash partitions or establish new hardware readiness. Old comments and series notes retain their original validation scope; they are not new acceptance results. See [status](docs/STATUS.md).
