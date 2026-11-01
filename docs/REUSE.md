# Reusing the hardware components

Use patches and driver sources with their recorded upstream bases. The Nix expressions are optional build recipes, not activation modules. No hardware operation is performed by the repository extraction.

## Kernel

The recipes pin Catcrafts `milos-linux` revision `63289f4411520a2acb38bd533437446d33fbce74` and a particular nixpkgs tarball. Source is external, not vendored. To reproduce the expected archive from an independently obtained checkout:

```sh
git -C /path/to/milos-linux archive --format=tar \
  --prefix=linux-63289f4411520a2acb38bd533437446d33fbce74/ \
  63289f4411520a2acb38bd533437446d33fbce74 | gzip -n \
  > kernel/linux-63289f4411520a2acb38bd533437446d33fbce74.tar.gz
```

Expected SHA256: `1a1aba170899273cbb97bce2dc0713957340a7be2e2d187faab6f821d60687ba`. Copy or hard-link the verified archive into `kernel/gmu-timeout/` under the same name for recipes referring there. Do not replace the hash just to bypass a mismatch. Archive creation depends on the original source and tool behavior; no source fetch/build was performed during extraction.

`kernel/base.config` is the original baseline; `features.config`, `prepare-config.sh` and `verify-config.py` describe configuration preparation. The preparation script expects the pinned checkout at `kernel/source/` and runs Kconfig tools. Final configs and recipes retain distinct variants. Kernel6 adds an experimental UFS suspend fix; kernel7 candidates are not automatically part of kernel6. Follow each recipe's patch ordering, not every patch in the repository at once.

Candidate compile-check recipes use exact historical `/nix/store` inputs and may refuse evaluation on another machine unless the documented parameters are supplied. `device-tree/build-preserved.nix` intentionally asserts a specific historical kernel derivation. It is a reference recipe, not a portable default target. Historical comments may name old paths, excluded trial targets or evidence that lives only upstream; use `provenance/files.json` for relocated files.

## Camera and firmware

`userspace/camera/libcamera/default.nix` preserves the pinned libcamera build and patch ordering. `selfie.nix` adds the experimental front-camera helper. Sensor tuning data is separate from the excluded application camera plugin. Check API differences and image quality against your chosen libcamera version.

`drivers/camera/s5kkd1/` and `s5kkd1-diagnostic/` are separate driver variants, not two modules to load together. Generated firmware headers contain only expected size/hash constants. Payloads must be obtained separately under their original terms; the extraction source and vendor pin metadata do not grant redistribution rights. References to the original review's source manifest/results are historical; the retained vendor pins and hashes provide the available source provenance.

## Audio and modem

`userspace/audio/ucm/` is the later UCM variant; `ucm-legacy/` preserves the earlier one. Choose one coherent card definition. Voice profiles and `cs-call/fp6-csvoiced` do not prove working calls. The daemon, IMS packages, oFono patches and rmtfs shadow source are hardware-facing components only; the consuming OS must decide activation, privileges, policy and matching firmware/topology.

GNSS helpers under `userspace/location/` speak QMI LOC over QRTR. Assistance may use network services and cached location. Audit their configuration and user-consent model before activation; extraction does not enable them.

Audio ACDB tools require external vendor libraries/data; they are retained as source-only inspection/extraction utilities. No proprietary ACDB payload, derived voice graph or host library is supplied.

## Compatibility

Mesa and PipeWire patches target existing upstream APIs and require version review. Mobile NixOS patches are explicitly distro-specific boot compatibility fixes; they do not impose NixOS on consumers of the other components. No complete device module, root-filesystem layout, default account, service policy or installation image is included.
