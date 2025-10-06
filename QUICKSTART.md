# Quick Start Guide

**Agents — From Management to AI Agent Management**

---

## ⚡ 30-Second Build

```bash
# Using Docker (recommended)
docker build -t agents-book .
docker run --rm -v "$PWD:/book" agents-book bash scripts/build_epub.sh
docker run --rm -v "$PWD:/book" agents-book bash scripts/build_pdf.sh

# Files created in: dist/
```

---

## ✅ Pre-Flight Check

```bash
bash scripts/verify.sh
```

This verifies:
- ✅ All 18 chapters present
- ✅ All 5 appendices present
- ✅ All scripts and configs valid
- ✅ Dependencies available

---

## 📦 What Gets Built

### EPUB (Kindle)
- **File**: `dist/Agents_Agent-Edition.epub`
- **Use for**: Amazon KDP upload
- **Size**: ~2-3 MB
- **Includes**: Full table of contents, metadata, all chapters + appendices

### PDF (Print)
- **File**: `dist/Agents_Agent-Edition.pdf`
- **Use for**: Print-on-demand (Amazon KDP, IngramSpark, etc.)
- **Size**: 6×9 inches, B/W
- **Pages**: ~350-400 (estimated)

---

## 🐛 Troubleshooting

### "pandoc: command not found"

**Solution**: Use Docker instead, or install pandoc:
```bash
# macOS
brew install pandoc

# Ubuntu/Debian
sudo apt-get install pandoc texlive-full
```

### "python3: command not found"

**Solution**: Install Python 3:
```bash
# macOS
brew install python3

# Ubuntu/Debian
sudo apt-get install python3
```

### Build fails with font errors

**Solution**: Use Docker which includes all required fonts, or install:
```bash
# macOS
brew install font-dejavu

# Ubuntu/Debian
sudo apt-get install fonts-dejavu
```

### "No such file or directory: chapters/book-manifest.json"

**Solution**: You're in the wrong directory. Run from repo root:
```bash
cd /Users/rickwong/Documents/GitHub/book-ai-manager
bash scripts/verify.sh
```

---

## 📝 Making Changes

### Edit a Chapter

1. Edit the file in `chapters/`
2. Rebuild: `bash scripts/build_epub.sh`

### Add a Chapter

1. Create `chapters/XX-new-chapter.md`
2. Add to `chapters/book-manifest.json` in the `files` array
3. Rebuild

### Update Metadata

Edit `metadata/book.yaml` to change:
- Title
- Author
- Keywords
- Categories

---

## 🎯 Common Tasks

### Preview EPUB
```bash
# macOS
open dist/Agents_Agent-Edition.epub

# Linux
xdg-open dist/Agents_Agent-Edition.epub

# Or use Calibre: https://calibre-ebook.com/
```

### Preview PDF
```bash
# macOS
open dist/Agents_Agent-Edition.pdf

# Linux
xdg-open dist/Agents_Agent-Edition.pdf
```

### Check Word Count
```bash
# Approximate word count for all chapters
wc -w chapters/*.md chapters/appendices/*.md
```

### Validate Structure
```bash
bash scripts/verify.sh
```

---

## 📚 File Locations

| Content | Location |
|---------|----------|
| Chapters | `chapters/01-*.md` through `18-*.md` |
| Appendices | `chapters/appendices/appendix-*.md` |
| Build scripts | `scripts/build_*.sh` |
| Metadata | `metadata/book.yaml` |
| TOC | `chapters/TOC.md` |
| Build manifest | `chapters/book-manifest.json` |
| Output | `dist/` (created on build) |

---

## 🚀 Publishing Checklist

- [ ] Run `bash scripts/verify.sh` - all green?
- [ ] Build EPUB: `bash scripts/build_epub.sh`
- [ ] Build PDF: `bash scripts/build_pdf.sh`
- [ ] Test EPUB in Kindle Previewer
- [ ] Test PDF print preview (actual size)
- [ ] Verify metadata in `metadata/book.yaml`
- [ ] Verify keywords (7 max for Amazon)
- [ ] Create cover (separate from manuscript)
- [ ] Upload EPUB to Amazon KDP
- [ ] Upload PDF for print (if doing paperback)
- [ ] Set pricing
- [ ] Publish! 🎉

---

## 💡 Tips

### Fast Iteration
During editing, rebuild just EPUB (faster than PDF):
```bash
bash scripts/build_epub.sh && open dist/Agents_Agent-Edition.epub
```

### Docker-Free Builds
If you have pandoc/xelatex installed locally, skip Docker:
```bash
bash scripts/build_epub.sh
bash scripts/build_pdf.sh
```

### Parallel Builds
Build both at once:
```bash
bash scripts/build_epub.sh & bash scripts/build_pdf.sh & wait
```

### Clean Build
Remove old builds:
```bash
rm -rf dist/ .filelist.txt
bash scripts/build_epub.sh
```

---

## 📞 Need Help?

1. **Check verification**: `bash scripts/verify.sh`
2. **Check README**: Full details in `README.md`
3. **Check structure**: Ensure you're in repo root

---

**Ready? Let's build!**

```bash
bash scripts/verify.sh && \
  bash scripts/build_epub.sh && \
  bash scripts/build_pdf.sh && \
  echo "✅ Done! Check dist/ for your books."
```

