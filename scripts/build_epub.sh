#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
mkdir -p dist
python3 scripts/filelist.py > .filelist.txt
pandoc --from=markdown+yaml_metadata_block \
  --metadata-file metadata/book.yaml \
  --resource-path=.:chapters \
  --toc --toc-depth=2 \
  --css styles/epub.css \
  --output dist/Agents_Agent-Edition.epub \
  $(cat .filelist.txt)
echo "✅ EPUB built at dist/Agents_Agent-Edition.epub"
