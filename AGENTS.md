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
│   ├── model.scad      and/or model.f3d, .stl, .3mf
│   └── img/
└── model-name/
```

## Adding a new model

1. Copy `_template/` and name the copy after the model, lowercase with hyphens.
2. Edit `index.html` and `README.md`, and put your files in the folder.
3. Add the model to the table in the root `README.md` and to the list in the root `index.html`.

## Images

- Put photos in the model's `img/` folder.
- Compress them and strip their metadata before committing, using the repo script:
  `python scripts/compress_images.py <model>/img` (see `scripts/compress_images.py --help`).
- Rename the compressed files to lowercase, web-friendly names such as `coin-01.jpg`, `coin-02.jpg`, ... (no spaces, no DSLR names like `IMG_5931.JPG`).
- Reference them with relative paths (`img/coin-01.jpg`) in the HTML.

## Publishing the site

**Settings → Pages → Deploy from a branch → `main` / `(root)`**. Each guide is served at `https://alejandrosnz.github.io/3d-models/model-name/`. Use relative paths (`img/photo.jpg`) in the HTML files.
