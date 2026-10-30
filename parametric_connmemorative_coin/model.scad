// =====================================================================
//  Commemorative Coin / Coaster - multicolor generator WITH CENTER MOTIF
//  Made for MakerWorld (Parametric Model Maker) + Bambu Lab AMS.
//
//  Same border generator as commemorative_coin.scad, plus a parametric
//  center motif: big number, laurel wreath, sunburst, star, shield or
//  guilloché rosette.
//
//  - No relief: the whole design is COLOR, flush with the top face
//    (an "inlay_depth" mm inlay over a color 1 base).
//    Optional double-sided mode repeats it, mirrored, on the bottom face.
//  - The outer rim is always color 1 (black). The center background is
//    color 1 too, unless you pick another slot for it.
//  - Every center element (motif, accent, text, background) can use
//    any of the 4 slots.
//
//  Colors / AMS slots:
//    1 = outer rim + center + base     (black by default)
//    2 = ring background
//    3 = text
//    4 = details: banner, fillets, beads, stars, separators
//
//  Each color is a top-level object with color(): MakerWorld exports
//  them as separate parts in the 3MF. "export_part" also lets you
//  export each color on its own (STL) if needed.
// =====================================================================

/* [1. Design] */
// Item type (sets diameter, thickness and widths). "Custom" uses section 9
size_preset = "coaster90"; // [coaster90:Coaster Ø90 x 2 mm, coin50:Coin Ø50 x 3 mm, coin35:Coin Ø35 x 3 mm, custom:Custom]
// Text layout on the ring
layout = "top_bottom"; // [top_bottom:Top and bottom text, full360:360° text, top_stars:Top text + bottom stars, banner:Bottom banner + stars, banner_top:Bottom banner + top text]
// Double-sided: repeat the border on the bottom face (mirrored so it reads correctly)
double_sided = false;

/* [2. Text] */
// Top text (layouts: top and bottom, top + stars, banner + top text)
top_text = "COMMEMORATIVE";
// Bottom text (layout: top and bottom)
bottom_text = "EDITION 2026";
// Text for the 360° layout
text_360 = "COMMEMORATIVE COIN 2026";
// Banner text (banner layouts)
banner_text = "2026";
// Font family
font_family = "Liberation Sans"; // [Liberation Sans, Liberation Sans Narrow, Liberation Serif, Roboto, Montserrat, Oswald, Cinzel]
// Font style
font_style = "Bold"; // [Regular, Bold, Black, ExtraBold]

/* [3. Center motif] */
// Center design
center_motif = "laurel"; // [none:None (blank), number:Big number, laurel:Laurel wreath, sunburst:Sunburst, star:Star / compass, shield:Shield, guilloche:Guilloché rosette]
// Main center text (number, initials...)
center_text = "25";
// Small line under the main text (empty = none)
center_subtext = "YEARS";
// Motif size (fraction of the free center)
center_motif_scale = 1.0; // [0.5:0.01:1]
// Center text size (relative to automatic fit)
center_text_scale = 1.0; // [0.3:0.05:2.5]
// Small line size (relative to automatic fit), independent of the main text
center_subtext_scale = 1.0; // [0.3:0.05:2.5]
// Thin frame circle around the center (accent color)
center_frame = false;
// Slot for the motif shapes
center_motif_slot = 2; // [1:Color 1, 2:Color 2, 3:Color 3, 4:Color 4]
// Slot for accents (two-tone halves, shield border, frame, divider)
center_accent_slot = 4; // [1:Color 1, 2:Color 2, 3:Color 3, 4:Color 4]
// Slot for the center text
center_text_slot = 3; // [1:Color 1, 2:Color 2, 3:Color 3, 4:Color 4]
// Slot for the center background (1 = same black as the rim)
center_bg_slot = 1; // [1:Color 1, 2:Color 2, 3:Color 3, 4:Color 4]
// Back face motif (only in double-sided mode)
back_motif = "same"; // [same:Same as front, none:None (blank), number:Big number, laurel:Laurel wreath, sunburst:Sunburst, star:Star / compass, shield:Shield, guilloche:Guilloché rosette]
// Back face main text (empty = same as front)
back_center_text = "";
// Back face small line (empty = same as front)
back_center_subtext = "";

/* [4. Motif fine tuning] */
// Laurel: leaves per branch
laurel_leaves = 7; // [3:1:15]
// Laurel: leaf length (fraction of center radius)
laurel_leaf_size = 0.32; // [0.15:0.01:0.5]
// Laurel: leaf angle (degrees)
laurel_leaf_angle = 35; // [15:1:60]
// Laurel: gap between branch tips at the top (degrees)
laurel_top_gap = 50; // [10:1:150]
// Laurel: gap between branches at the bottom (degrees)
laurel_bottom_gap = 20; // [0:1:90]
// Sunburst: number of rays
sun_rays = 24; // [8:1:72]
// Sunburst: center disc size (fraction of center radius)
sun_disc_size = 0.45; // [0.2:0.01:0.8]
// Sunburst: ray width (fraction of the gap between rays)
sun_ray_width = 0.55; // [0.2:0.05:0.95]
// Sunburst: alternate rays in the accent color
sun_two_tone = false;
// Star: number of points (8 + two-tone = compass rose)
star_points = 5; // [3:1:16]
// Star: inner radius (fraction of outer)
star_inner = 0.45; // [0.15:0.01:0.8]
// Star: split each point in two colors (motif / accent)
star_two_tone = true;
// Shield: inner border line (accent color)
shield_border = true;
// Shield: border inset from the edge (mm)
shield_border_inset = 1.2; // [0.4:0.1:5]
// Guilloché: waves (lobes) per ring
guil_lobes = 12; // [3:1:40]
// Guilloché: interlaced copies per ring
guil_copies = 3; // [1:1:12]
// Guilloché: number of concentric rings
guil_rings = 1; // [1:1:5]
// Guilloché: wave amplitude (fraction of ring height)
guil_amplitude = 0.8; // [0.1:0.05:1]
// Guilloché: free center for the text (fraction of center radius)
guil_center_size = 0.4; // [0.15:0.01:0.8]
// Guilloché: alternate copies in the accent color
guil_two_tone = false;
// Guilloché: thin circle around the free center
guil_inner_circle = true;
// Gap between the center motif and the ring (mm)
center_margin = 1.0; // [0:0.1:5]

/* [5. Colors (preview only)] */
// Slot 1: outer rim + center + base. Pick a color name from the list; it is
// converted to hex internally for the 3MF export.
color_1 = "Black"; // [Black, White, Gold, Silver, Red, Blue, Green, Yellow, Orange, Purple, Pink, Gray, Brown, Copper, Bronze, Navy, Teal, Cyan, Magenta, Lime, Maroon, Olive, Coral, Indigo, Turquoise]
// Slot 2: ring background
color_2 = "Gold"; // [Black, White, Gold, Silver, Red, Blue, Green, Yellow, Orange, Purple, Pink, Gray, Brown, Copper, Bronze, Navy, Teal, Cyan, Magenta, Lime, Maroon, Olive, Coral, Indigo, Turquoise]
// Slot 3: text
color_3 = "White"; // [Black, White, Gold, Silver, Red, Blue, Green, Yellow, Orange, Purple, Pink, Gray, Brown, Copper, Bronze, Navy, Teal, Cyan, Magenta, Lime, Maroon, Olive, Coral, Indigo, Turquoise]
// Slot 4: details (banner, fillets, beads, stars)
color_4 = "Red"; // [Black, White, Gold, Silver, Red, Blue, Green, Yellow, Orange, Purple, Pink, Gray, Brown, Copper, Bronze, Navy, Teal, Cyan, Magenta, Lime, Maroon, Olive, Coral, Indigo, Turquoise]

/* [6. Decorations] */
// Fillets: thin lines on the inner and outer edge of the ring
show_fillets = true;
// Beads: ring of dots next to the outer rim
show_beads = false;
// Separators between texts (and between repetitions in 360° layout)
// "auto" picks a circle (dot) on the Ø50 coin, where the star is too small to print,
// and a star everywhere else.
separator_style = "auto"; // [auto:Automatic (circle on 50mm coin / star otherwise), star:Star, dot:Dot (circle), none:None]
// Arc of stars on the free part of the ring ("+ stars" layouts)
show_star_arc = true;
// Number of stars in the arc (0 = automatic)
star_count = 0; // [0:1:40]

/* [7. Banner] */
// Banner shape
banner_shape = "curved"; // [curved:Curved (follows the ring), straight:Straight]
// Banner ends
banner_ends = "notch"; // [notch:Swallowtail, point:Pointed, flat:Flat]
// Banner height in mm (0 = automatic)
banner_height = 0; // [0:0.5:30]
// Side margin between text and banner end (mm)
banner_padding = 2.5; // [0:0.5:15]
// Banner text scale relative to ring text
banner_text_scale = 1.0; // [0.5:0.05:2]
// Banner outline in color 1 (mm, 0 = no outline)
banner_border = 0.8; // [0:0.2:3]

/* [8. Text fine tuning] */
// Text size in mm (0 = automatic, based on ring width)
text_size = 0; // [0:0.1:20]
// Fraction of the usable ring width taken by the text (automatic mode)
text_fill = 0.62; // [0.3:0.01:0.9]
// Letter spacing
letter_spacing = 1.05; // [0.7:0.01:2]
// Text repetitions in 360° layout
repeat_360 = 1; // [1:1:4]
// 360° layout: stretch text to fill the whole circle
fit_360 = true;

/* [9. Custom dimensions] */
// Total diameter (mm)
custom_diameter = 60; // [20:1:200]
// Total thickness (mm)
custom_thickness = 2.5; // [1:0.1:10]
// Outer rim width (color 1, mm)
custom_rim_width = 2; // [0:0.1:15]
// Color ring width (mm)
custom_band_width = 9; // [2:0.1:40]

/* [10. Fine details] */
// Fillet width (mm, ideally a multiple of the line width)
fillet_width = 0.8; // [0.4:0.1:3]
// Gap between fillets/beads and edges (mm)
detail_gap = 0.8; // [0.2:0.1:3]
// Bead diameter (mm)
bead_diameter = 1.2; // [0.6:0.1:4]
// Bead pitch (multiple of diameter)
bead_pitch = 2.0; // [1.3:0.1:4]
// Separator size (relative to text height)
separator_scale = 0.9; // [0.3:0.05:2]
// Arc star size (relative to text height)
star_scale = 0.75; // [0.3:0.05:2]
// Arc star pitch (multiple of star size)
star_pitch = 1.8; // [1.1:0.1:5]

/* [11. Edge] */
// Top edge chamfer (mm, 0 = sharp edge). Limited to the outer rim width
top_chamfer = 0.6; // [0:0.1:3]
// Bottom edge chamfer (mm, 0 = sharp edge). Also helps against elephant foot
bottom_chamfer = 0.4; // [0:0.1:3]

/* [12. Printing / AMS] */
// Color depth on the top face (mm; multiple of layer height)
inlay_depth = 0.6; // [0.2:0.04:2]
// What to export (All = multicolor; or a single color to export separately)
export_part = "all"; // [all:All (multicolor), c1:Color 1 only, c2:Color 2 only, c3:Color 3 only, c4:Color 4 only]
// Circle resolution
circle_fn = 180; // [64:8:360]
// Letter resolution
text_fn = 32; // [8:4:96]

/* [Hidden] */
// Convert a color name (or pass-through hex code) to a hex string.
// Names are resolved to the palette used by this model; anything starting
// with "#" (or unknown) is returned unchanged so hex codes keep working.
function to_hex(c) =
    len(c) > 0 && c[0] == "#" ? c :
    c == "Black"     ? "#111111" :
    c == "White"     ? "#F5F5F5" :
    c == "Gold"      ? "#D4AF37" :
    c == "Silver"    ? "#C0C0C0" :
    c == "Red"       ? "#B22222" :
    c == "Blue"      ? "#1E5AA8" :
    c == "Green"     ? "#2E7D32" :
    c == "Yellow"    ? "#F2C200" :
    c == "Orange"    ? "#E67E22" :
    c == "Purple"    ? "#6A1B9A" :
    c == "Pink"      ? "#E91E63" :
    c == "Gray"      ? "#808080" :
    c == "Grey"      ? "#808080" :
    c == "Brown"     ? "#5D4037" :
    c == "Copper"    ? "#B87333" :
    c == "Bronze"    ? "#CD7F32" :
    c == "Navy"      ? "#1F3864" :
    c == "Teal"      ? "#008080" :
    c == "Cyan"      ? "#00BCD4" :
    c == "Magenta"   ? "#C2185B" :
    c == "Lime"      ? "#7CB342" :
    c == "Maroon"    ? "#800000" :
    c == "Olive"     ? "#556B2F" :
    c == "Coral"     ? "#FF7F50" :
    c == "Indigo"    ? "#3F51B5" :
    c == "Turquoise" ? "#40E0D0" :
    c;
eps = 0.01;
// Liberation Sans (≈ Arial) metrics in OpenSCAD:
// cap height ≈ size, and 1 em ≈ size / 0.72
CAP = 1.0;
EM = 1 / 0.72;

// id, diameter, thickness, outer rim, ring
PRESETS = [
    ["coaster90", 90, 2, 3,   12],
    ["coin50",    50, 3, 1.5, 8],
    ["coin35",    35, 3, 1.0, 6.0]
];
CUSTOM = ["custom", custom_diameter, custom_thickness, custom_rim_width, custom_band_width];
function preset() = let(p = [for (q = PRESETS) if (q[0] == size_preset) q]) len(p) > 0 ? p[0] : CUSTOM;

P = preset();
D      = P[1];
T      = P[2];
RIM_W  = P[3];
BAND_W = P[4];
// Leave at least 0.2 mm of solid color 1 core between inlays
DEPTH  = double_sided ? min(inlay_depth, (T - 0.2) / 2) : min(inlay_depth, T - 0.2);
FONT   = str(font_family, ":style=", font_style);
// Chamfers: limited to the outer rim width, so they never cut a colored inlay
CH_TOP = max(0, min(top_chamfer, RIM_W, T / 2 - 0.1));
CH_BOT = max(0, min(bottom_chamfer, double_sided ? RIM_W : T, T / 2 - 0.1));

is_banner = layout == "banner" || layout == "banner_top";

// Effective separator style: "auto" resolves to a circle (dot) on the Ø50 coin
// (the star separator is too small to print there) and to a star everywhere else.
separator_eff = separator_style == "auto"
    ? (size_preset == "coin50" ? "dot" : "star")
    : separator_style;

// ---------- Radial zones (outside to inside) ----------
// rim | gap | beads | gap | fillet | TEXT ZONE | fillet | gap | center
R         = D / 2;
r_rim     = R - RIM_W;                 // inner edge of the outer rim
r_band_in = r_rim - BAND_W;            // inner edge of the ring
r_bead    = r_rim - detail_gap - bead_diameter / 2;
r_after_b = show_beads ? r_rim - detail_gap - bead_diameter : r_rim;
r_fo_out  = show_fillets ? r_after_b - detail_gap : r_after_b;
r_tz_out  = show_fillets ? r_fo_out - fillet_width : r_after_b;
r_fi_in   = show_fillets ? r_band_in + detail_gap : r_band_in;
r_tz_in   = show_fillets ? r_fi_in + fillet_width : r_band_in;
tz_w      = r_tz_out - r_tz_in;
r_txt     = (r_tz_out + r_tz_in) / 2;

txt_size  = text_size > 0 ? text_size : tz_w * text_fill;
cap       = txt_size * CAP;
sep_d     = cap * separator_scale;
star_d    = cap * star_scale;

assert(r_band_in > 0, "The ring is wider than the coin: reduce the ring or rim width");
assert(tz_w > 0.5, "No room left for text: reduce fillets/beads or increase the ring width");

// ---------- Text helpers ----------
function in_set(c, s) = len([for (x = s) if (x == c) 1]) > 0;
// Approximate advance width (fraction of em, Arial Bold-like metrics)
function char_w(c) =
    in_set(c, " ")                                   ? 0.28  :
    in_set(c, "iIjl.,:;'!|·")                        ? 0.28  :
    in_set(c, "ftr-()[]/")                           ? 0.36  :
    in_set(c, "MWmw@")                               ? 0.89  :
    in_set(c, "0123456789")                          ? 0.556 :
    in_set(c, "ABCDEFGHKLNOPQRSTUVXYZÁÉÍÓÚÑÜÇ")      ? 0.72  :
    0.58;
function str_widths(s, sz) = [for (i = [0:1:len(s) - 1]) char_w(s[i]) * EM * sz * letter_spacing];
function psum(v, n) = n <= 0 ? 0 : psum(v, n - 1) + v[n - 1];
function text_len(s, sz) = psum(str_widths(s, sz), len(s));
function len2deg(l, r) = l / r * 180 / PI;
function arc_deg(s, r, sz) = len2deg(text_len(s, sz), r);
// Polar point: θ in degrees from the top, clockwise
function polar_top(r, a) = [r * sin(a), r * cos(a)];
// Polar point centered at the bottom: a in degrees, counter-clockwise
function polar_bottom(r, a) = [r * sin(a), -r * cos(a)];

module glyph(c, sz) {
    text(c, size = sz, font = FONT, halign = "center", valign = "baseline", $fn = text_fn);
}

// Text along an arc. top=true: read from the top (letters facing out);
// top=false: read from the bottom (letters facing in).
// center_deg rotates the whole text (counter-clockwise); stretch>1 spreads letters.
module arc_text(s, r, sz, top = true, center_deg = 0, stretch = 1) {
    if (len(s) > 0) {
        ws = str_widths(s, sz);
        total = psum(ws, len(s));
        for (i = [0:1:len(s) - 1]) {
            a = len2deg((psum(ws, i) + ws[i] / 2 - total / 2) * stretch, r);
            if (top)
                rotate([0, 0, center_deg - a]) translate([0, r - sz * CAP / 2]) glyph(s[i], sz);
            else
                rotate([0, 0, center_deg + a]) translate([0, -(r + sz * CAP / 2)]) glyph(s[i], sz);
        }
    }
}

// ---------- Basic shapes ----------
module annulus(r1, r2) {
    difference() {
        circle(r = r2, $fn = circle_fn);
        circle(r = max(r1, eps), $fn = circle_fn);
    }
}

module star2d(d, points = 5, inner = 0.45) {
    polygon([for (i = [0:1:2 * points - 1])
        let(rr = (i % 2 == 0) ? d / 2 : d / 2 * inner, a = 90 + i * 180 / points)
        [rr * cos(a), rr * sin(a)]]);
}

module separator2d(d) {
    if (separator_eff == "star") star2d(d);
    else if (separator_eff == "dot") circle(d = d * 0.6, $fn = 32);
}

// Places children on the ring at θ degrees (from the top, clockwise), facing outwards
module on_ring(theta, r) {
    rotate([0, 0, -theta]) translate([0, r]) children();
}

// N stars spread over the arc [t1, t2] (degrees from the top, clockwise)
module star_arc(t1, t2) {
    span = t2 - t1;
    n = star_count > 0 ? star_count : floor(span * PI / 180 * r_txt / (star_d * star_pitch));
    if (span > 0 && n > 0)
        for (i = [0:1:n - 1])
            on_ring(t1 + (i + 0.5) * span / n, r_txt) star2d(star_d);
}

// ---------- Banner ----------
b_sz     = txt_size * banner_text_scale;
b_h      = banner_height > 0 ? banner_height : b_sz * CAP * 2.1;
b_out    = r_tz_out;
b_in     = b_out - b_h;
b_mid    = (b_out + b_in) / 2;
b_end    = banner_ends == "flat" ? 0 : b_h * 0.4;   // swallowtail/point depth
// curved
b_tdeg   = arc_deg(banner_text, b_mid, b_sz);
b_end_d  = len2deg(b_end, b_mid);
b_half   = b_tdeg / 2 + len2deg(banner_padding, b_mid) + (banner_ends == "notch" ? b_end_d : 0);
// straight
b_hw     = text_len(banner_text, b_sz) / 2 + banner_padding + (banner_ends == "notch" ? b_end : 0);
b_ext    = banner_ends == "point" ? b_end : 0;
b_yc     = sqrt(max(0, pow(b_out, 2) - pow(b_hw + b_ext, 2))) - b_h / 2;
// half-angle covered by the banner on the ring (for stars/separators)
b_margin = len2deg(star_d, r_txt);
b_deg    = banner_shape == "curved"
    ? b_half + (banner_ends == "point" ? b_end_d : 0) + len2deg(banner_border, r_txt) + b_margin
    : asin(min(1, (b_hw + b_ext + banner_border) / r_txt)) + b_margin;

module banner_shape() {
    steps = 48;
    if (banner_shape == "curved") {
        tip = banner_ends == "notch" ? -b_end_d : b_end_d;
        polygon(concat(
            [for (i = [0:1:steps]) polar_bottom(b_out, -b_half + i * 2 * b_half / steps)],
            banner_ends == "flat" ? [] : [polar_bottom(b_mid, b_half + tip)],
            [for (i = [steps:-1:0]) polar_bottom(b_in, -b_half + i * 2 * b_half / steps)],
            banner_ends == "flat" ? [] : [polar_bottom(b_mid, -b_half - tip)]
        ));
    } else {
        hh = b_h / 2;
        tip = banner_ends == "notch" ? -b_end : b_end;
        translate([0, -b_yc])
            polygon(concat(
                [[-b_hw, -hh], [b_hw, -hh]],
                banner_ends == "flat" ? [] : [[b_hw + tip, 0]],
                [[b_hw, hh], [-b_hw, hh]],
                banner_ends == "flat" ? [] : [[-b_hw - tip, 0]]
            ));
    }
}

module banner_outer() {
    offset(delta = banner_border) banner_shape();
}

module banner_text2d() {
    if (banner_shape == "curved")
        arc_text(banner_text, b_mid, b_sz, top = false);
    else
        translate([0, -b_yc - b_sz * CAP / 2])
            text(banner_text, size = b_sz, font = FONT, halign = "center", valign = "baseline",
                 spacing = letter_spacing, $fn = text_fn);
}

// ---------- Ring content per layout ----------
top_span    = arc_deg(top_text, r_txt, txt_size);
bottom_span = arc_deg(bottom_text, r_txt, txt_size);

seg_360     = 360 / repeat_360;
gap_360     = len2deg(separator_eff == "none" ? cap : sep_d * 2, r_txt);
avail_360   = (seg_360 - gap_360) * PI / 180 * r_txt;
len_360     = text_len(text_360, txt_size);
stretch_360 = len_360 <= 0 ? 1 : (fit_360 ? avail_360 / len_360 : min(1, avail_360 / len_360));

module ring_text2d() {
    if (layout == "top_bottom") {
        arc_text(top_text, r_txt, txt_size, top = true);
        arc_text(bottom_text, r_txt, txt_size, top = false);
    } else if (layout == "full360") {
        for (k = [0:1:repeat_360 - 1])
            arc_text(text_360, r_txt, txt_size, top = true, center_deg = -k * seg_360, stretch = stretch_360);
    } else if (layout == "top_stars" || layout == "banner_top") {
        arc_text(top_text, r_txt, txt_size, top = true);
    }
}

module all_text2d() {
    ring_text2d();
    if (is_banner) banner_text2d();
}

module details2d() {
    if (show_fillets) {
        annulus(r_fo_out - fillet_width, r_fo_out);
        annulus(r_fi_in, r_fi_in + fillet_width);
    }
    if (show_beads) {
        n = floor(2 * PI * r_bead / (bead_diameter * bead_pitch));
        for (i = [0:1:n - 1]) on_ring(i * 360 / n, r_bead) circle(d = bead_diameter, $fn = 16);
    }
    // Separators
    if (separator_eff != "none") {
        if (layout == "top_bottom") {
            t = (top_span / 2 + 180 - bottom_span / 2) / 2;
            on_ring(t, r_txt) separator2d(sep_d);
            on_ring(360 - t, r_txt) separator2d(sep_d);
        } else if (layout == "full360") {
            for (k = [0:1:repeat_360 - 1]) on_ring((k + 0.5) * seg_360, r_txt) separator2d(sep_d);
        } else if (layout == "banner_top") {
            t = (top_span / 2 + 180 - b_deg) / 2;
            on_ring(t, r_txt) separator2d(sep_d);
            on_ring(360 - t, r_txt) separator2d(sep_d);
        }
    }
    // Star arc on the free part of the ring
    if (show_star_arc) {
        m = len2deg(star_d * 1.2, r_txt);
        if (layout == "top_stars")
            star_arc(top_span / 2 + m, 360 - top_span / 2 - m);
        else if (layout == "banner")
            star_arc(180 + b_deg, 540 - b_deg);
    }
}

// ---------- Center motif ----------
// Free center: from the ring's inner edge, minus margin and optional frame
rc_out = r_band_in - center_margin;
R_M    = (center_frame ? rc_out - fillet_width - detail_gap : rc_out) * center_motif_scale;

back_m   = back_motif == "same" ? center_motif : back_motif;
back_t   = len(back_center_text) > 0 ? back_center_text : center_text;
back_sub = len(back_center_subtext) > 0 ? back_center_subtext : center_subtext;

// Arc band between radii r1..r2 and angles t1..t2 (degrees from the top, clockwise)
module arc2d(r1, r2, t1, t2, steps = 64) {
    polygon(concat(
        [for (i = [0:1:steps]) polar_top(r2, t1 + i * (t2 - t1) / steps)],
        [for (i = [steps:-1:0]) polar_top(r1, t1 + i * (t2 - t1) / steps)]
    ));
}

// Pointed leaf from the origin along +x
module leaf(l, w) {
    polygon(concat(
        [for (a = [0:10:180]) [l * a / 180, w / 2 * sin(a)]],
        [for (a = [170:-10:10]) [l * a / 180, -w / 2 * sin(a)]]
    ));
}

// Main text + optional small line, stacked and fitted inside a circle of radius ra.
// Returns [main size, sub size, gap, total height]
function label_sizes(t, sub, ra) =
    let(has_t = len(t) > 0,
        has_s = len(sub) > 0,
        sm = has_t ? min(ra * (has_s ? 0.7 : 0.85), ra * 1.6 / max(text_len(t, 1), eps)) * center_text_scale : 0,
        hs = has_s ? min(has_t ? sm * 0.45 : ra * 0.5 * center_text_scale, ra * 1.3 / max(text_len(sub, 1), eps)) * center_subtext_scale : 0,
        g  = (has_t && has_s) ? sm * 0.3 : 0)
    [sm, hs, g, sm + g + hs];

module center_label(t, sub, ra) {
    ls = label_sizes(t, sub, ra);
    if (len(t) > 0)
        translate([0, ls[3] / 2 - ls[0] / 2])
            text(t, size = ls[0], font = FONT, halign = "center", valign = "center",
                 spacing = letter_spacing, $fn = text_fn);
    if (len(sub) > 0)
        translate([0, -ls[3] / 2 + ls[1] / 2])
            text(sub, size = ls[1], font = FONT, halign = "center", valign = "center",
                 spacing = letter_spacing, $fn = text_fn);
}

// Short bar between main text and small line
module label_divider(t, sub, ra) {
    ls = label_sizes(t, sub, ra);
    if (len(t) > 0 && len(sub) > 0)
        translate([0, -ls[3] / 2 + ls[1] + ls[2] / 2])
            square([text_len(sub, ls[1]), min(fillet_width, ls[2] * 0.4)], center = true);
}

// --- Laurel wreath ---
lau_l   = R_M * laurel_leaf_size;
lau_w   = lau_l * 0.42;
lau_ext = lau_l * sin(laurel_leaf_angle) + lau_w / 2;   // radial reach of a leaf
lau_rb  = R_M - lau_ext;                                 // branch radius
lau_in  = lau_rb - lau_ext - detail_gap;                 // free radius inside the wreath

// Right branch: grows from the bottom up to the top (counter-clockwise)
module laurel_branch() {
    t_top = laurel_top_gap / 2;
    t_bot = 180 - laurel_bottom_gap / 2;
    span = t_bot - t_top;
    arc2d(lau_rb - fillet_width / 2, lau_rb + fillet_width / 2, t_top, t_bot);
    for (i = [0:1:laurel_leaves - 1])
        on_ring(t_bot - (i + 0.5) * span / laurel_leaves, lau_rb) {
            rotate([0, 0, 180 - laurel_leaf_angle]) leaf(lau_l, lau_w);
            rotate([0, 0, 180 + laurel_leaf_angle]) leaf(lau_l, lau_w);
        }
    on_ring(t_top, lau_rb) rotate([0, 0, 180]) leaf(lau_l, lau_w);
}

// --- Sunburst ---
sun_disc = R_M * sun_disc_size;

module sun_ray(i) {
    pitch = 360 / sun_rays;
    th = (i + 0.5) * pitch;
    r1 = sun_disc + detail_gap;
    wo = pitch / 2 * sun_ray_width;
    wi = len2deg(0.3, r1);
    polygon([polar_top(r1, th - wi), polar_top(R_M, th - wo), polar_top(R_M, th + wo), polar_top(r1, th + wi)]);
}

// --- Star / compass ---
star_ri = R_M * star_inner;

// Half of point i: side s = +1 (right) or -1 (left)
module star_half(i, s) {
    a = i * 360 / star_points;
    polygon([[0, 0], polar_top(R_M, a), polar_top(star_ri, a + s * 180 / star_points)]);
}

// --- Shield ---
function qbez(p0, p1, p2, t) = pow(1 - t, 2) * p0 + 2 * (1 - t) * t * p1 + pow(t, 2) * p2;
SHIELD_R = concat([[0.42, 0.5], [0.42, -0.05]],
                  [for (k = [1:1:16]) qbez([0.42, -0.05], [0.42, -0.42], [0, -0.62], k / 16)]);
SHIELD   = concat(SHIELD_R, [for (i = [len(SHIELD_R) - 2:-1:0]) [-SHIELD_R[i][0], SHIELD_R[i][1]]]);
sh_s     = R_M * 0.97 / norm([0.42, 0.5]);

module shield_shape() {
    scale([sh_s, sh_s]) polygon(SHIELD);
}

// --- Guilloché rosette ---
// Rings of wavy closed lines r = r0 + a·sin(k·θ), each copy phase-shifted,
// so the overlapping strokes interlace like a banknote rosette
guil_free = R_M * guil_center_size;
guil_h    = (R_M - guil_free - detail_gap) / guil_rings;   // radial height of each ring

function guil_curve(r0, a, phase, off) =
    let(n = min(720, guil_lobes * 18))
    [for (i = [0:1:n - 1]) let(t = i * 360 / n) polar_top(r0 + a * sin(guil_lobes * (t + phase)) + off, t)];

// Constant-width stroke along one wavy closed curve
module guil_line(r0, a, phase) {
    difference() {
        offset(r = fillet_width / 2, $fn = 12) polygon(guil_curve(r0, a, phase, 0));
        offset(r = -fillet_width / 2, $fn = 12) polygon(guil_curve(r0, a, phase, 0));
    }
}

// Copies with index parity p (0 = even, 1 = odd, -1 = all)
module guil_copies_set(p) {
    for (j = [0:1:guil_rings - 1], c = [0:1:guil_copies - 1])
        if (p < 0 || c % 2 == p) {
            r0 = guil_free + detail_gap + (j + 0.5) * guil_h;
            a = max(0, guil_h / 2 - fillet_width / 2) * guil_amplitude;
            guil_line(r0, a, c * (360 / guil_lobes) / guil_copies + j * 180 / guil_lobes);
        }
}

// --- Motif dispatch: shapes per role ---
module motif_main(m) {
    if (m == "laurel") {
        laurel_branch();
        mirror([1, 0, 0]) laurel_branch();
    } else if (m == "sunburst") {
        circle(r = sun_disc, $fn = circle_fn);
        for (i = [0:1:sun_rays - 1]) if (!(sun_two_tone && i % 2 == 1)) sun_ray(i);
    } else if (m == "star") {
        for (i = [0:1:star_points - 1]) {
            star_half(i, 1);
            if (!star_two_tone) star_half(i, -1);
        }
    } else if (m == "shield") {
        shield_shape();
    } else if (m == "guilloche") {
        guil_copies_set(guil_two_tone ? 0 : -1);
        if (guil_inner_circle) annulus(guil_free - fillet_width, guil_free);
    }
}

module motif_accent(m, t, sub) {
    if (m != "none" && center_frame) annulus(rc_out - fillet_width, rc_out);
    if (m == "number") {
        label_divider(t, sub, R_M);
    } else if (m == "sunburst" && sun_two_tone) {
        for (i = [1:2:sun_rays - 1]) sun_ray(i);
    } else if (m == "star" && star_two_tone) {
        for (i = [0:1:star_points - 1]) star_half(i, -1);
    } else if (m == "shield" && shield_border) {
        difference() {
            offset(delta = -shield_border_inset) shield_shape();
            offset(delta = -shield_border_inset - fillet_width) shield_shape();
        }
    } else if (m == "guilloche" && guil_two_tone) {
        guil_copies_set(1);
    }
}

module motif_text(m, t, sub) {
    if (m == "number")        center_label(t, sub, R_M);
    else if (m == "laurel")   center_label(t, sub, lau_in);
    else if (m == "sunburst") center_label(t, sub, sun_disc * 0.9);
    else if (m == "star")     center_label(t, sub, star_ri * 0.9);
    else if (m == "shield")   translate([0, 0.04 * sh_s]) center_label(t, sub, 0.34 * sh_s);
    else if (m == "guilloche") center_label(t, sub, (guil_free - fillet_width - detail_gap) * 0.95);
}

// Center region for slot k. Priority: text > accent > motif > background
module center_slot(k, m, t, sub) {
    difference() {
        intersection() {
            circle(r = r_band_in, $fn = circle_fn);
            union() {
                if (center_text_slot == k) motif_text(m, t, sub);
                if (center_accent_slot == k) difference() {
                    motif_accent(m, t, sub);
                    motif_text(m, t, sub);
                }
                if (center_motif_slot == k) difference() {
                    motif_main(m);
                    motif_accent(m, t, sub);
                    motif_text(m, t, sub);
                }
                if (center_bg_slot == k) difference() {
                    circle(r = r_band_in, $fn = circle_fn);
                    motif_main(m);
                    motif_accent(m, t, sub);
                    motif_text(m, t, sub);
                }
            }
        }
        // The banner (and its outline) lies over the center
        if (is_banner) banner_outer();
    }
}

// ---------- Color regions (2D, non-overlapping) ----------
module clip_inner() {
    intersection() {
        circle(r = r_rim, $fn = circle_fn);
        children();
    }
}

// Ring text
module region_text() {
    clip_inner() all_text2d();
}

// Ring details + banner
module region_details() {
    clip_inner() difference() {
        union() {
            difference() {
                details2d();
                if (is_banner) banner_outer();
            }
            if (is_banner) banner_shape();
        }
        all_text2d();
    }
}

// Ring background
module region_band() {
    difference() {
        annulus(r_band_in, r_rim);
        if (is_banner) banner_outer();
        details2d();
        all_text2d();
    }
}

// Everything of slot k (2..4) on one face. Slot 1 is the body itself
module face2d(k, m, t, sub) {
    if (k == 2) region_band();
    if (k == 3) region_text();
    if (k == 4) region_details();
    center_slot(k, m, t, sub);
}

module front2d(k) { face2d(k, center_motif, center_text, center_subtext); }
module back2d(k)  { mirror([1, 0, 0]) face2d(k, back_m, back_t, back_sub); }

// ---------- Solids ----------
// Colored inlay of slot k on the top face and, if double-sided, on the bottom face
module inlay(k) {
    translate([0, 0, T - DEPTH]) linear_extrude(height = DEPTH) front2d(k);
    if (double_sided) linear_extrude(height = DEPTH) back2d(k);
}

// Disc with chamfered top and bottom edges
module chamfered_disc() {
    rotate_extrude($fn = circle_fn)
        polygon([
            [0, 0],
            [R - CH_BOT, 0],
            [R, CH_BOT],
            [R, T - CH_TOP],
            [R - CH_TOP, T],
            [0, T]
        ]);
}

// Color 1: full base with the inlay pockets cut out
module body_c1() {
    difference() {
        chamfered_disc();
        translate([0, 0, T - DEPTH]) linear_extrude(height = DEPTH + 1)
            for (k = [2:4]) front2d(k);
        if (double_sided)
            translate([0, 0, -1]) linear_extrude(height = DEPTH + 1)
                for (k = [2:4]) back2d(k);
    }
}

// ---------- Info ----------
echo(str("Item: Ø", D, " x ", T, " mm | rim ", RIM_W, " | ring ", BAND_W,
         " | center Ø", 2 * r_band_in, " mm | ring text ", txt_size, " mm"));
if (DEPTH < inlay_depth)
    echo(str("WARNING: color depth limited to ", DEPTH, " mm by the item thickness"));
if (top_chamfer > CH_TOP)
    echo(str("WARNING: top chamfer limited to ", CH_TOP, " mm (outer rim width / thickness)"));
if (bottom_chamfer > CH_BOT)
    echo(str("WARNING: bottom chamfer limited to ", CH_BOT, " mm (outer rim width / thickness)"));
if (layout == "top_bottom" && top_span + bottom_span > 330)
    echo("WARNING: top and bottom texts overlap; shorten them or reduce the size");
if (top_span > 300 && (layout == "top_stars" || layout == "banner_top"))
    echo("WARNING: the top text is too long for the ring");
if (!fit_360 && len_360 > avail_360 && layout == "full360")
    echo("WARNING: the 360° text does not fit and has been compressed");
if (center_motif != "none" && center_motif != "number" && center_motif_slot == center_bg_slot)
    echo("WARNING: center motif and background use the same slot, the motif will not be visible");
if (center_text_slot == center_motif_slot && center_motif != "number" && center_motif != "laurel" && center_motif != "guilloche")
    echo("WARNING: center text and motif use the same slot, the text will not be visible");
if (center_motif == "guilloche" && guil_h < 3 * fillet_width)
    echo("WARNING: guilloché rings are very thin; use fewer rings or a smaller free center");
if (center_motif == "laurel" && lau_in < 2)
    echo("WARNING: little room inside the laurel wreath; reduce the leaf size");

// ---------- Output (one object per color = one part per AMS slot) ----------
if (export_part == "all" || export_part == "c1") color(to_hex(color_1)) body_c1();
if (export_part == "all" || export_part == "c2") color(to_hex(color_2)) inlay(2);
if (export_part == "all" || export_part == "c3") color(to_hex(color_3)) inlay(3);
if (export_part == "all" || export_part == "c4") color(to_hex(color_4)) inlay(4);
