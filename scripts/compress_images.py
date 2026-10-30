#!/usr/bin/env python3
"""Compress images and strip their metadata (EXIF, XMP, ICC, ...).

Examples:
    python compress_images.py parametric_connmemorative_coin/img
    python compress_images.py img/*.jpg --max-width 1600 --quality 80
    python compress_images.py photos --output-dir photos_compressed --keep-originals

Dependencies:
    pip install Pillow
"""

from __future__ import annotations

import argparse
import os
import sys
from pathlib import Path

from PIL import Image, ImageOps

SUPPORTED = {".jpg", ".jpeg", ".png", ".webp", ".tif", ".tiff", ".bmp"}


def human(n: int) -> str:
    for unit in ("B", "KB", "MB", "GB"):
        if n < 1024:
            return f"{n:.1f} {unit}"
        n /= 1024
    return f"{n:.1f} TB"


def compress_one(src: Path, dst: Path, max_width: int, max_height: int,
                 quality: int, keep_format: bool) -> tuple[int, int]:
    """Return (original_size, new_size)."""
    original_size = src.stat().st_size

    with Image.open(src) as img:
        # Bake EXIF orientation into pixels before dropping metadata.
        img = ImageOps.exif_transpose(img)

        # Resize if needed, keeping aspect ratio.
        w, h = img.size
        if max_width or max_height:
            mw = max_width or w
            mh = max_height or h
            if w > mw or h > mh:
                ratio = min(mw / w, mh / h)
                new_size = (max(1, int(w * ratio)), max(1, int(h * ratio)))
                img = img.resize(new_size, Image.LANCZOS)

        # Normalize for output format.
        ext = (dst.suffix.lower() or src.suffix.lower())
        if ext in (".jpg", ".jpeg"):
            if img.mode not in ("RGB", "L"):
                img = img.convert("RGB")
            save_kwargs = dict(
                format="JPEG",
                quality=quality,
                optimize=True,
                progressive=True,
                subsampling="4:2:0",
            )
        elif ext == ".png":
            if img.mode == "P":
                img = img.convert("RGBA")
            save_kwargs = dict(format="PNG", optimize=True)
        elif ext == ".webp":
            if img.mode not in ("RGB", "RGBA", "L"):
                img = img.convert("RGB")
            save_kwargs = dict(format="WEBP", quality=quality, method=6)
        else:
            # Fall back to original format handling.
            save_kwargs = dict(optimize=True)

        # Strip metadata: do not pass exif/icc_profile/xmp. Re-encode cleanly.
        dst.parent.mkdir(parents=True, exist_ok=True)
        img.save(dst, **save_kwargs)

    return original_size, dst.stat().st_size


def collect_inputs(paths: list[str], recursive: bool) -> list[Path]:
    result: list[Path] = []
    for p in paths:
        path = Path(p)
        if path.is_file():
            if path.suffix.lower() in SUPPORTED:
                result.append(path)
        elif path.is_dir():
            iterator = path.rglob("*") if recursive else path.iterdir()
            for f in iterator:
                if f.is_file() and f.suffix.lower() in SUPPORTED:
                    result.append(f)
        else:
            # glob patterns are expanded by the shell; if not, try glob
            for f in Path(".").glob(p):
                if f.is_file() and f.suffix.lower() in SUPPORTED:
                    result.append(f)
    # de-dup preserving order
    seen = set()
    unique = []
    for f in result:
        if f.resolve() not in seen:
            seen.add(f.resolve())
            unique.append(f)
    return unique


def main() -> int:
    parser = argparse.ArgumentParser(description="Compress images and strip metadata.")
    parser.add_argument("inputs", nargs="+", help="Files, directories or glob patterns.")
    parser.add_argument("--max-width", type=int, default=2000,
                        help="Max output width in px (default: 2000). 0 = no resize.")
    parser.add_argument("--max-height", type=int, default=0,
                        help="Max output height in px (default: 0 = derive from width).")
    parser.add_argument("--quality", type=int, default=85,
                        help="JPEG/WebP quality 1-95 (default: 85).")
    parser.add_argument("--output-dir", type=str, default=None,
                        help="Write results here instead of overwriting in place "
                             "(directory structure is preserved).")
    parser.add_argument("--keep-originals", action="store_true",
                        help="When overwriting in place, save a .orig backup of each file.")
    parser.add_argument("--recursive", action="store_true", default=True,
                        help="Recurse into directories (default: on).")
    parser.add_argument("--no-recursive", dest="recursive", action="store_false",
                        help="Do not recurse into directories.")
    parser.add_argument("--dry-run", action="store_true",
                        help="Show what would be done without writing.")
    parser.add_argument("--format", choices=["keep", "jpeg", "png", "webp"], default="keep",
                        help="Output format (default: keep original).")
    args = parser.parse_args()

    files = collect_inputs(args.inputs, args.recursive)
    if not files:
        print("No supported images found.", file=sys.stderr)
        return 1

    total_before = total_after = 0
    for src in files:
        if args.output_dir:
            rel = src
            # preserve relative path if input was a directory; best effort
            dst = Path(args.output_dir) / src.name
        else:
            dst = src

        if args.format != "keep":
            new_ext = {"jpeg": ".jpg", "png": ".png", "webp": ".webp"}[args.format]
            dst = dst.with_suffix(new_ext)

        replace_original = False
        if dst.resolve() == src.resolve():
            if args.keep_originals:
                backup = src.with_suffix(src.suffix + ".orig")
                if not backup.exists():
                    backup.write_bytes(src.read_bytes())
            # overwrite in place via a temp file
            tmp = src.with_name(src.stem + ".tmp" + src.suffix)
            final_dst = tmp
            replace_original = True
        else:
            final_dst = dst

        if args.dry_run:
            print(f"[dry-run] {src} -> {dst} ({human(src.stat().st_size)})")
            continue

        try:
            before, after = compress_one(src, final_dst, args.max_width,
                                        args.max_height, args.quality, True)
        except Exception as e:  # noqa: BLE001
            print(f"ERROR {src}: {e}", file=sys.stderr)
            if final_dst != src and final_dst.exists():
                final_dst.unlink(missing_ok=True)
            continue

        if replace_original:
            # replace original with compressed temp
            os.replace(final_dst, src)
            final_dst = src
            after = src.stat().st_size

        total_before += before
        total_after += after
        saved = before - after
        pct = (saved / before * 100) if before else 0
        print(f"{src}  {human(before)} -> {human(after)}  (-{pct:.1f}%)")

    if not args.dry_run and files:
        print(f"\nTotal: {human(total_before)} -> {human(total_after)} "
              f"(-{(total_before - total_after) / total_before * 100:.1f}%)")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
