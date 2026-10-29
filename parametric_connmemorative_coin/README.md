# Commemorative Coin & Coaster – Multicolor Generator with Center Motifs

Make **commemorative coins** and **coasters** with classic coin-style borders: curved text, banners, stars, beads and fine lines. The center gets a **parametric motif**: a big number, a laurel wreath, a sunburst, a star or compass rose, a shield, or a banknote-style guilloché rosette. Everything is printed in **up to 4 colors with the Bambu Lab AMS**.

The design is **flat, color only, with no relief**. Every color sits flush with the top face.

> Want to put your own design in the center? Use the **border-only version**, which leaves the center blank.

---

## ✨ Features

- **6 center motifs**, each with its own text:
  - **Big number:** a year, an anniversary or a ranking, with an optional small line underneath
  - **Laurel wreath:** two leafy branches around a number or initials
  - **Sunburst:** rays around a central disc, optionally in two colors
  - **Star / compass rose:** 3 to 16 points, with two-tone points for a compass look
  - **Shield:** a heraldic shield with an inner border and initials
  - **Guilloché rosette:** interlaced wavy lines like the ones on banknotes, with the text in a free center
- **Free color assignment in the center:** the motif, accents, text and background can each use any of the 4 slots
- **3 ready-made sizes**, plus fully custom dimensions:
  - Coaster: Ø90 × 2 mm
  - Coin: Ø50 × 3 mm
  - Coin: Ø35 × 3 mm
- **5 classic border layouts:**
  - Top and bottom text
  - 360° text all around the ring
  - Top text with stars along the bottom
  - Bottom banner with stars
  - Bottom banner with top text
- **Optional double-sided coin:** the back can use a different motif and text
- **Chamfered edges** on top and bottom, so the edge isn't sharp
- **Decorations:** fine lines (fillets), beaded ring, star or dot separators, and an arc of stars
- **AMS-ready:** each color is exported as a separate part, so you just assign filaments and print

---

## 🎨 Color slots

| Slot | Border | Center (default) | Default color |
|------|--------|------------------|---------------|
| **1** | Outer rim + base | Background | Black |
| **2** | Ring background | Motif shapes | Gold |
| **3** | Ring text | Center text | White |
| **4** | Banner, fillets, beads, stars | Accents: two-tone halves, shield border, frame, alternate guilloché lines | Red |

The border always uses the slots shown above. **Section 3** lets you move any center element to another slot. A few examples:

- **Black number on a gold disc:** set the background to slot 2 and the text to slot 1.
- **Red shield with white initials:** set the motif to slot 4.

> The colors in the customizer only affect the **preview**. You pick the real filaments in Bambu Studio after you open the 3MF.
>
> In the customizer you can type a **color name** (Black, Gold, White, Red, Silver, Copper, Blue, Green, ...) or a **hex code** (`#RRGGBB`); names are converted to hex internally.

---

## 🚀 Quick start

1. Click **Customize** (Parametric Model Maker).
2. In **1. Design**, choose the **size** and the **border layout**.
3. In **2. Text**, type the border texts.
4. In **3. Center motif**, choose a motif and type the center text (for example `25` / `YEARS`, or initials).
5. Click **Generate**, then **Download 3MF** (or open it directly in Bambu Studio).
6. In Bambu Studio, assign one filament to each of the 4 parts, then slice and print.

---

## 🧭 Parameters, section by section

Sections are ordered from most to least important. Most people only need sections 1 to 3.

### 1. Design
- **Item type:** a preset size (coaster or coin) or *Custom*. *Custom* uses the values in section 9.
- **Text layout** of the border ring:
  - *Top and bottom text*: the classic coin, with separators on both sides.
  - *360° text*: one continuous text around the whole ring. It can be repeated (section 8).
  - *Top text + bottom stars*: the euro-coin style.
  - *Bottom banner + stars*: a ribbon with text at the bottom, and stars along the rest of the ring.
  - *Bottom banner + top text*: a ribbon at the bottom and an arc of text on top.
- **Double-sided** (off by default): adds a second face on the bottom. It is mirrored, so it reads correctly when you flip the coin.
  - Each face's color depth is capped at (thickness − 0.2 mm) / 2.

> 💡 With a banner layout, the banner lies **over** the lower part of the center motif. If the overlap bothers you, reduce **Motif size**.

### 2. Text
- **Top text / Bottom text / 360° text / Banner text:** each one is only used by the layouts that need it.
- **Font family / Font style:** used for both the border and the center. If a font or style isn't available, OpenSCAD silently falls back to a default font.

### 3. Center motif
- **Center design:** *None*, *Big number*, *Laurel wreath*, *Sunburst*, *Star / compass*, *Shield* or *Guilloché rosette*.
- **Main center text:** a number, a year or initials. It is sized automatically to fit the motif, and short texts (1 to 4 characters) look best. Leave it empty for a motif with no text.
- **Small line:** optional smaller text under the main one (`YEARS`, `EST.`, `CHAMPION`…). With *Big number*, a short divider bar is drawn between the two lines.
- **Motif size / Center text size:** scale the motif and the text.
- **Center frame:** a thin circle around the center, in the accent color.
- **Slots:** choose the slot (1 to 4) for the motif, accents, text and background. If an element shares a slot with whatever is under it, it becomes invisible, and the console shows a warning.
- **Back face** (double-sided only):
  - Choose a motif for the back: *Same as front*, a different motif, or *None*.
  - Choose its texts. An empty field means "same as front".

### 4. Motif fine tuning
- **Laurel:**
  - Leaves per branch, leaf length and leaf angle
  - Opening at the top and gap at the bottom
  - If the text inside gets too small, shorten the leaves.
- **Sunburst:**
  - Number of rays
  - Size of the center disc
  - Ray width
  - *Two-tone*: alternates the rays in the accent color.
- **Star:**
  - Number of points
  - Inner radius
  - *Two-tone*: splits each point into motif and accent halves.
  - 🧭 **Compass rose:** 8 points, inner radius about 0.3, two-tone on.
- **Shield:** inner border line on or off, and how far it sits from the edge.
- **Guilloché:**
  - Each ring is made of several copies of a wavy closed line, each one shifted slightly, so they interlace.
  - **Waves:** how many lobes each line has.
  - **Copies:** how many interlaced lines each ring has.
  - **Rings:** how many concentric rings there are.
  - **Amplitude:** how deep the waves are.
  - **Free center:** the size of the empty center that holds the text.
  - **Two-tone:** alternates the copies between the motif and accent colors.
  - **Inner circle:** a thin circle around the free center.
  - The line width is the **Fillet width** (section 10).
- **Center margin:** the gap between the motif and the border ring.

### 5. Colors (preview only)
Hex colors used for the on-screen preview of each slot.

### 6. Decorations
- **Fillets:** thin lines on the inner and outer edges of the ring.
- **Beads:** a ring of small dots next to the outer rim.
- **Separators:** a star, a dot or nothing between texts.
- **Star arc:** fills the free part of the ring with stars. Set the count yourself, or use `0` for automatic.

### 7. Banner
- **Shape:** *curved* follows the ring, while *straight* is a flat ribbon.
- **Ends:** swallowtail, pointed or flat.
- **Height / side padding / text scale:** control how big the ribbon is.
- **Outline:** a thin color-1 border around the banner. Set it to `0` to remove it.

### 8. Text fine tuning (border ring)
- **Text size:** `0` means automatic: the text fits the usable ring width, scaled by **Text fill**.
- **Letter spacing:** also applies to the center text.
- **Repetitions (360°)** and **Stretch to fill (360°)**.

### 9. Custom dimensions
Only used when **Item type = Custom**:
- **Diameter** and **thickness** of the piece
- **Outer rim width** (color 1)
- **Color ring width**

The center diameter is `diameter − 2 × (rim + ring)`.

### 10. Fine details
- Fillet width: this is also the width of the laurel stems, the frame, the divider bar and the shield border.
- Gaps
- Bead size and pitch
- Separator size, and star size and pitch

### 11. Edge
- **Top chamfer** (default 0.6 mm) and **Bottom chamfer** (default 0.4 mm). They only cut into the outer rim and never touch the colors.
- Set either one to `0` for a sharp edge.

### 12. Printing / AMS
- **Color depth:** how deep the colored inlay goes. The default is 0.6 mm, which is 3 layers at 0.2 mm. Keep it a multiple of your layer height.
- **Export:** *All* generates the multicolor model. *Color N only* exports a single color as a separate part.
- **Resolution:** smoothness of circles and letters. Higher values make generation slower.

---

## 🖨️ Printing tips

- **Print with the colored face up.** The color is only on the top layers, so filament changes happen only there and **purge waste is much lower** than with full-height multicolor. In double-sided mode, changes happen on the bottom layers too.
- **Double-sided coins:** a clean first layer is essential, since it becomes the back face. A smooth PEI plate gives a glossy back.
- **Layer height:** 0.2 mm (or 0.16 mm for small coins). Make the color depth a multiple of it. For the Ø35 coin, a 0.2 mm nozzle is recommended for better detail.
- **Minimum details:** keep lines at 0.8 mm or more (2 lines with a 0.4 mm nozzle). For the Ø35 coin, a 0.2 mm nozzle is recommended for better detail.
  - On the **Ø35 coin**, prefer simple motifs (number, shield, 5-point star) and few laurel leaves.
  - Two-tone sunbursts with many rays get very thin near the disc.
  - **Guilloché** is the most delicate motif. Lines must be at least 0.8 mm wide with gaps of at least about 0.6 mm between them, or they merge into a solid area.
    - On coins, start with 1 or 2 rings, 3 or 4 copies and 8 to 12 waves.
    - On the Ø90 coaster you can go up to 3 rings and 6 copies.
    - Check the result in the slicer preview before printing.
- **Ironing** on the top surface gives a beautiful, smooth coin finish.

---

## ❓ FAQ

**The center text is too small or too big.**
Use **Center text size**. Short texts work best, since the size shrinks to make long ones fit.

**My motif disappeared.**
It is probably on the same slot as the center background. Check the slots in section 3.

**Letters on the ring look unevenly spaced.**
OpenSCAD can't measure exact letter widths, so the arc spacing uses Arial-like metrics. Tweak **Letter spacing** for other fonts.

**Can I use fewer than 4 colors?**
Yes. Assign the same filament to two parts in Bambu Studio.

**Can I add my own logo instead of a motif?**
Set **Center design = None**, or use the border-only version, then add your SVG or STL as a part in Bambu Studio. Place it flush with the top face, using the same depth as **Color depth**.

---

Made with OpenSCAD. Remixes and feedback are welcome! 🪙
