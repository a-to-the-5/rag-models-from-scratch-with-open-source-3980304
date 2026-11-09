#!/bin/bash
set -e

MODEL_DIR="/models/Qwen3-Embedding-0.6B"

if [ ! -d "$MODEL_DIR/.git" ]; then
    echo "Downloading Qwen3-Embedding-0.6B model..."

    if [ -z "$HF_USERNAME" ] || [ -z "$HF_TOKEN" ]; then
        echo "Error: HF_USERNAME and HF_TOKEN environment variables must be set"
        exit 1
    fi

    git clone "https://${HF_USERNAME}:${HF_TOKEN}@huggingface.co/Qwen/Qwen3-Embedding-0.6B" "$MODEL_DIR"
    echo "Model download completed successfully"
else
    echo "Model already exists at $MODEL_DIR, skipping download"
fi
