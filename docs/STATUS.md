# Hardware status and evidence boundaries

This extraction adds no runtime validation. Source status statements originate in the pinned public repository and may refer to excluded desktop targets. They are not portable test guarantees.

| Area | Retained work | Qualification boundary |
|---|---|---|
| Kernel/display/touch | Kernel variants, ESWIN fixes, panel candidates, GMU/CCHE fixes | Kernel7 candidates include explicitly unbooted/experimental work; do not assume upstream merge or hardware acceptance |
| Storage/power/sensors | UFS suspend, battery reporting/control, STK3310 fixes | Original port kept suspend guarded off pending supervised validation |
| Camera | CAMSS patches, experimental driver/DT, libcamera software ISP/tuning | Original app-level camera claims do not validate these components in a new OS |
| Audio | UCM variants, experimental CS voice helper, kernel voice-path patches | Original port reports calls/VoLTE not working; helper source does not change that |
| Modem/GNSS | oFono/IMS/lpac/rmtfs and QMI LOC helpers | Original GNSS report lacked a confirmed fix; integration remains consumer-owned |
| Fingerprint | Transport diagnostics, enrollment-preservation patch and build recipe | No enrollment, trustlet activation or authentication integration performed |
| Firmware | Extraction/provenance and integrity constants | No firmware payloads or permission to redistribute vendor material supplied |

Read original patch notes for per-variant ordering and limitations. Original commit messages may mention omitted integration changes; only the allowlisted file history is retained. Original mailing-list recipient lists and author credits are public upstream metadata. No patches were submitted upstream by this extraction.
