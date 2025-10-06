#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
mkdir -p dist
python3 scripts/filelist.py > .filelist.txt
pandoc --from=markdown+yaml_metadata_block \
  --metadata-file metadata/book.yaml \
  --resource-path=.:chapters \
  --template styles/template.latex \
  --pdf-engine=xelatex \
  --toc --toc-depth=2 \
  --output dist/Agents_Agent-Edition.pdf \
  $(cat .filelist.txt)
echo "✅ PDF built at dist/Agents_Agent-Edition.pdf"
