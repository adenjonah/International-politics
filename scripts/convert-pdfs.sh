#!/bin/bash
# Convert PDFs in class-material/ to searchable .txt files in class-material/converted/
# Requires: brew install poppler (provides pdftotext)
# Usage: bash scripts/convert-pdfs.sh

set -euo pipefail

MATERIAL_DIR="class-material"
CONVERTED_DIR="class-material/converted"

# Check pdftotext is available
if ! command -v pdftotext &> /dev/null; then
    echo "Error: pdftotext not found. Install with: brew install poppler"
    exit 1
fi

mkdir -p "$CONVERTED_DIR"

converted=0
skipped=0

for pdf in "$MATERIAL_DIR"/*.pdf; do
    # Handle case where no PDFs exist
    [ -f "$pdf" ] || continue

    filename=$(basename "$pdf" .pdf)
    output="$CONVERTED_DIR/${filename}.txt"

    # Skip if already converted and PDF hasn't changed
    if [ -f "$output" ] && [ "$output" -nt "$pdf" ]; then
        echo "Skip (already converted): $filename.pdf"
        skipped=$((skipped + 1))
        continue
    fi

    echo "Converting: $filename.pdf"

    # Add source header, then convert
    {
        echo "# Source: $filename.pdf"
        echo "# Converted: $(date '+%Y-%m-%d %H:%M')"
        echo "# Note: Line numbers here differ from PDF page numbers"
        echo "---"
        echo ""
        pdftotext -layout "$pdf" -
    } > "$output"

    converted=$((converted + 1))
done

echo ""
echo "Done. Converted: $converted | Skipped: $skipped"
