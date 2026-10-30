# AGENTS.md

Guidelines for adding and publishing models in this repository.

## Structure

```
3d-models/
├── README.md
├── LICENSE
├── index.html          site home page
├── assets/style.css    shared style for all guides
├── _template/          copy this folder for each new model
│   ├── index.html      guide
│   ├── README.md
│   ├── MAKERWORLD.MD   MakerWorld listing description + metadata
│   ├── model.scad      and/or model.f3d, .stl, .3mf
│   └── img/
└── model-name/
```

## Adding a new model

1. Copy `_template/` and name the copy after the model, lowercase with hyphens.
2. Edit `index.html` and `README.md`, and put your files in the folder.
3. Copy `_template/MAKERWORLD.MD` to the new folder and fill in its metadata and listing description.
4. Add the model to the table in the root `README.md` and to the list in the root `index.html`.

## MakerWorld listing (MAKERWORLD.MD)

- Each model folder contains a `MAKERWORLD.MD` with the listing description published on MakerWorld.
- It starts with a YAML frontmatter block (delimited by `---`) with metadata, then the description body (Markdown).
- Frontmatter fields: `title`, `slug`, `makerworld_url`, `author`, `license`, `version`, `updated`, `tags`.
- `tags`: always include 15 to 20 relevant tags (lowercase; hyphenate multi-word tags).
- `makerworld_url` is the public MakerWorld model URL (fill it in once the model is published; use `TODO` as placeholder until then).
- Copy `_template/MAKERWORLD.MD` when adding a new model and fill in the metadata and description.
- Keep the body in sync with the actual MakerWorld listing.

## Images

- Put photos in the model's `img/` folder.
- Compress them and strip their metadata before committing, using the repo script:
  `python scripts/compress_images.py <model>/img` (see `scripts/compress_images.py --help`).
- Rename the compressed files to lowercase, web-friendly names such as `coin-01.jpg`, `coin-02.jpg`, ... (no spaces, no DSLR names like `IMG_5931.JPG`).
- Reference them with relative paths (`img/coin-01.jpg`) in the HTML.

## Publishing the site

**Settings → Pages → Deploy from a branch → `main` / `(root)`**. Each guide is served at `https://alejandrosnz.github.io/3d-models/model-name/`. Use relative paths (`img/photo.jpg`) in the HTML files.
