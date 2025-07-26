#!/usr/bin/env bash

set -euo pipefail

# Variables
LLAMA_DIR="${HOME}/src/github.com/ggerganov/llama.cpp"
MODEL_DIR="${HOME}/.local/share/models/deepseek-coder"
MODEL_FILE="deepseek-coder-6.7b-instruct.Q4_K_M.gguf"
GGUF_URL="https://huggingface.co/TheBloke/deepseek-coder-6.7B-instruct-GGUF/resolve/main/${MODEL_FILE}"

# echo "🔧 Installing dependencies..."
# brew install cmake curl

echo "📦 Cloning llama.cpp with Metal support..."
if [[ ! -d "${LLAMA_DIR}" ]]; then
  git clone https://github.com/ggerganov/llama.cpp.git "${LLAMA_DIR}"
fi

echo "🔨 Building llama.cpp with CMake and Metal..."
cd "${LLAMA_DIR}"
mkdir -p build
cd build
cmake -DLLAMA_METAL=on ..
cmake --build . --config Release

echo "📁 Creating model directory..."
mkdir -p "${MODEL_DIR}"

echo "⬇️ Downloading quantized DeepSeek Coder model (Q4_K_M) with curl..."
# curl -fLsS -H "Authorization: Bearer ${HF_TOKEN:?}" -o "${MODEL_DIR}/${MODEL_FILE}" "${GGUF_URL}"
curl -fL -o "${MODEL_DIR}/${MODEL_FILE}" "${GGUF_URL}"

echo "✅ Setup complete."
