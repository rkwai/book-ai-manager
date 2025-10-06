#!/usr/bin/env bash
# Verification script to check repository structure and dependencies

set -euo pipefail
cd "$(dirname "$0")/.."

echo "🔍 Verifying Agents Book Repository..."
echo ""

# Color codes
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check critical directories
echo "📁 Checking directory structure..."
REQUIRED_DIRS=(
    "chapters"
    "chapters/frontmatter"
    "chapters/appendices"
    "metadata"
    "scripts"
    "styles"
)

for dir in "${REQUIRED_DIRS[@]}"; do
    if [ -d "$dir" ]; then
        echo -e "  ${GREEN}✓${NC} $dir/"
    else
        echo -e "  ${RED}✗${NC} $dir/ (missing)"
        exit 1
    fi
done

# Check critical files
echo ""
echo "📄 Checking critical files..."
REQUIRED_FILES=(
    "chapters/book-manifest.json"
    "metadata/book.yaml"
    "scripts/build_epub.sh"
    "scripts/build_pdf.sh"
    "scripts/filelist.py"
    "styles/epub.css"
    "styles/template.latex"
    "Dockerfile"
    "README.md"
)

for file in "${REQUIRED_FILES[@]}"; do
    if [ -f "$file" ]; then
        echo -e "  ${GREEN}✓${NC} $file"
    else
        echo -e "  ${RED}✗${NC} $file (missing)"
        exit 1
    fi
done

# Check chapter files
echo ""
echo "📖 Checking manuscript chapters..."
CHAPTER_COUNT=$(find chapters -maxdepth 1 -name "[0-9][0-9]-*.md" | wc -l | tr -d ' ')
APPENDIX_COUNT=$(find chapters/appendices -name "appendix-*.md" 2>/dev/null | wc -l | tr -d ' ')

if [ "$CHAPTER_COUNT" -eq 18 ]; then
    echo -e "  ${GREEN}✓${NC} 18 chapters found"
else
    echo -e "  ${YELLOW}⚠${NC} Expected 18 chapters, found $CHAPTER_COUNT"
fi

if [ "$APPENDIX_COUNT" -eq 5 ]; then
    echo -e "  ${GREEN}✓${NC} 5 appendices found"
else
    echo -e "  ${YELLOW}⚠${NC} Expected 5 appendices, found $APPENDIX_COUNT"
fi

# Check for build dependencies
echo ""
echo "🔧 Checking build dependencies..."

if command -v python3 &> /dev/null; then
    PYTHON_VERSION=$(python3 --version 2>&1 | cut -d ' ' -f 2)
    echo -e "  ${GREEN}✓${NC} python3 ($PYTHON_VERSION)"
else
    echo -e "  ${RED}✗${NC} python3 (not found)"
    exit 1
fi

if command -v pandoc &> /dev/null; then
    PANDOC_VERSION=$(pandoc --version | head -n 1 | cut -d ' ' -f 2)
    echo -e "  ${GREEN}✓${NC} pandoc ($PANDOC_VERSION)"
else
    echo -e "  ${YELLOW}⚠${NC} pandoc (not found - required for building)"
fi

if command -v xelatex &> /dev/null; then
    echo -e "  ${GREEN}✓${NC} xelatex (found)"
else
    echo -e "  ${YELLOW}⚠${NC} xelatex (not found - required for PDF)"
fi

if command -v docker &> /dev/null; then
    DOCKER_VERSION=$(docker --version | cut -d ' ' -f 3 | tr -d ',')
    echo -e "  ${GREEN}✓${NC} docker ($DOCKER_VERSION)"
else
    echo -e "  ${YELLOW}⚠${NC} docker (not found - optional for containerized builds)"
fi

# Validate manifest
echo ""
echo "📋 Validating book manifest..."
if python3 -c "import json; json.load(open('chapters/book-manifest.json'))" 2>/dev/null; then
    echo -e "  ${GREEN}✓${NC} book-manifest.json is valid JSON"
else
    echo -e "  ${RED}✗${NC} book-manifest.json is invalid JSON"
    exit 1
fi

# Test filelist script
echo ""
echo "📝 Testing filelist generation..."
FILE_COUNT=$(python3 scripts/filelist.py | wc -l | tr -d ' ')
if [ "$FILE_COUNT" -gt 0 ]; then
    echo -e "  ${GREEN}✓${NC} filelist.py generates $FILE_COUNT files"
else
    echo -e "  ${RED}✗${NC} filelist.py failed to generate file list"
    exit 1
fi

# Summary
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "${GREEN}✅ Repository structure verified!${NC}"
echo ""
echo "📚 Book Status:"
echo "  • Chapters: $CHAPTER_COUNT/18"
echo "  • Appendices: $APPENDIX_COUNT/5"
echo "  • Total files: $FILE_COUNT"
echo ""
echo "🚀 Ready to build:"
echo "  • EPUB: bash scripts/build_epub.sh"
echo "  • PDF:  bash scripts/build_pdf.sh"
echo "  • Both: bash scripts/build_epub.sh && bash scripts/build_pdf.sh"
echo ""
echo "🐳 Or use Docker:"
echo "  • docker build -t agents-book ."
echo "  • docker run --rm -v \"\$PWD:/book\" agents-book bash scripts/build_epub.sh"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

