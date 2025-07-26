#!/usr/bin/env bash
set -euo pipefail

LLAMA_DIR="${HOME}/src/github.com/ggerganov/llama.cpp"
MODEL_PATH="${HOME}/.local/share/models/deepseek-coder/deepseek-coder-6.7b-instruct.Q4_K_M.gguf"

PROMPT_FILE="./PROMPT.md"
TRANSCRIPT_FILE="./transcript.txt"
TMP_INPUT=$(mktemp)
TMP_OUTPUT=$(mktemp)
trap 'rm -f "$TMP_INPUT" "$TMP_OUTPUT"' EXIT

# Load initial prompt
if [[ -f "${PROMPT_FILE}" ]]; then
  cat "${PROMPT_FILE}" >"${TMP_INPUT}"
else
  echo "⚠️ prompt.md not found, starting from scratch."
  touch "${TMP_INPUT}"
fi

# Start transcript log
echo -e "\n--- NEW SESSION: $(date) ---\n" >>"${TRANSCRIPT_FILE}"

# Run loop
while true; do
  echo
  read -rp "🧑 You: " USER_INPUT

  if [[ "${USER_INPUT}" == "exit" ]]; then
    echo "👋 Exiting."
    break
  fi

  echo -e "\n🧑 You: ${USER_INPUT}" >>"${TRANSCRIPT_FILE}"
  echo -e "\n🧑 You: ${USER_INPUT}" >>"${TMP_INPUT}"

  # Run model
  "${LLAMA_DIR}/build/bin/llama-cli" \
    -m "${MODEL_PATH}" \
    -ngl 1 \
    -t 6 \
    -n 512 \
    -p "$(cat "${TMP_INPUT}")" >"${TMP_OUTPUT}"

  # Print model reply
  echo
  sed 's/^/🤖 /' "${TMP_OUTPUT}" | tee -a "${TRANSCRIPT_FILE}"

  # Append model output to context for memory
  echo >>"${TMP_INPUT}"
  cat "${TMP_OUTPUT}" >>"${TMP_INPUT}"

  # Optional: handle tool calls in model response
  TOOL_JSON=$(grep -oP '{[^}]+}' "${TMP_OUTPUT}" | tail -n 1 || true)

  if [[ -n "${TOOL_JSON}" ]]; then
    TOOL_CALL=$(jq -c 'select(.tool and .input)' <<<"${TOOL_JSON}" 2>/dev/null || true)
    if [[ -n "${TOOL_CALL}" ]]; then
      TOOL=$(jq -r '.tool' <<<"${TOOL_CALL}")
      INPUT=$(jq -r '.input' <<<"${TOOL_CALL}")

      echo -e "\n⚠️ Tool call detected: ${TOOL}: ${INPUT}" | tee -a "${TRANSCRIPT_FILE}"

      if [[ "${TOOL}" == "shell" ]]; then
        echo "🧪 Running shell: ${INPUT}"
        TOOL_OUT=$(~/.local/bin/tool-wrapper.sh "${INPUT}" 2>&1)
        echo -e "\n📤 Tool output:\n${TOOL_OUT}" | tee -a "${TRANSCRIPT_FILE}"

        # Add output to prompt context
        echo -e "\n📤 Tool output:\n${TOOL_OUT}" >>"${TMP_INPUT}"
      fi
    fi
  fi
done
