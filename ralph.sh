#!/bin/bash
set -e

MAX_ITERATIONS=${1:-10}
SCRIPT_DIR="$(cd "$(dirname \
  "${BASH_SOURCE[0]}")" && pwd)"

echo "🚀 Starting Ralph"

OPENCODE_MODEL=${OPENCODE_MODEL-opencode/minimax-m2.1}
OPENCODE_VARIANT=${OPENCODE_VARIANT-xhigh}

MODEL_ARG=()
if [[ -n "${OPENCODE_MODEL:-}" ]]; then
  MODEL_ARG=(-m "$OPENCODE_MODEL")
fi

VARIANT_ARG=()
if [[ -n "${OPENCODE_VARIANT:-}" ]] && \
  opencode run --help 2>/dev/null | grep -q -- "--variant"
then
  VARIANT_ARG=(--variant "$OPENCODE_VARIANT")
fi

for i in $(seq 1 $MAX_ITERATIONS); do
  echo "═══ Iteration $i ═══"
  
  OUTPUT=$(opencode run "${MODEL_ARG[@]}" "${VARIANT_ARG[@]}" \
    "$(cat "$SCRIPT_DIR/prompt.md")" 2>&1 \
    | tee /dev/stderr) || true
  
  if echo "$OUTPUT" | \
    grep -q "<promise>COMPLETE</promise>"
  then
    echo "✅ Done!"
    exit 0
  fi
  
  sleep 2
done

echo "⚠️ Max iterations reached"
exit 1
