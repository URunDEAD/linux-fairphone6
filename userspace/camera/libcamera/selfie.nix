# Separate selfie-only userspace extension; rear production package stays pinned.
{ callPackage }:
(callPackage ./default.nix {}).overrideAttrs (old: {
  pname = "libcamera-fp6-selfie";
  patches = (old.patches or []) ++ [ ./selfie-helper.patch ];
  checkPhase = ''
    runHook preCheck
    meson test --no-rebuild --print-errorlogs fp6_sensor_helpers fp6_selfie_sensor_helper
    runHook postCheck
  '';
})
