#!/usr/bin/env python3
import json, os
root = os.path.dirname(os.path.dirname(__file__))
chapters_dir = os.path.join(root, "chapters")
with open(os.path.join(chapters_dir, "book-manifest.json")) as f:
    man = json.load(f)
for p in man.get("files", []):
    if p.endswith(".md"):
        print(os.path.join("chapters", p))
