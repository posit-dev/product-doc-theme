# Product branding: logo and color

Each product documentation site sets its own logo and primary color.
The theme ships neutral defaults (the Posit icon logo and Posit blue), and a product overrides them in its own repo.

| | Where it is set | File |
| --- | --- | --- |
| Logo, logo alt text, title | Project config | `_quarto.yml` |
| Primary color (light and dark) | A Sass file per color mode | `product-light.scss`, `product-dark.scss` |

Both need the theme installed as a Quarto extension (`quarto add posit-dev/product-doc-theme`).
Linking only the compiled theme CSS from a CDN does not carry these settings, because the logo and the derived colors are applied when the site is rendered.

## Logo

Set the logo, its alt text and the site title in `_quarto.yml`.
A value set in the project overrides the extension's default.

```yaml
project:
  title: Workbench Documentation   # no "Posit" prefix when a product logo is used

website:
  navbar:
    logo: images/logo-workbench.svg
    logo-alt: Posit Workbench
```

- Put the logo file in the product repo and point `logo` at it (a path relative to the project root).
- The theme sets the navbar logo height (`$navbar-logo-height`, 36px) and, in dark mode, renders the logo in white. Use a single-color-safe SVG.
- Do not repeat the Help menu or other navbar entries the extension already provides unless you mean to replace them.

## Primary color

The primary color is a Sass variable (`$primary`), so it is set in a small `.scss` file, not directly in `_quarto.yml`.
The theme derives the tints and shades it needs (sidebar active item, dividers, version dropdown, table stripes and hover, preview badge) from the primary, so you only choose one color per mode.

### 1. Light mode: `product-light.scss`

```scss
/*-- scss:defaults --*/
$primary: #496331; // Workbench: Posit green-700
```

### 2. Dark mode: `product-dark.scss`

```scss
/*-- scss:defaults --*/
$primary: #adbf99;      // lighter shade, readable on the dark background
$primary-base: #72994e; // the product's main color, used for translucent washes
```

### 3. Register both files in `_quarto.yml`

```yaml
format:
  html:
    theme:
      light: [product-light.scss]
      dark: [product-dark.scss]
```

Your list is added to the theme's own, so you do not need to list `theme.scss`.

### Rules for these files

- **Use hex values.** The theme's palette variables (such as `$posit-green-700`) are not defined yet when these files load.
- **Use the `scss:defaults` layer.** The theme's `$primary` is a `!default`, so only a value set in that layer takes effect.
- **Leave out `$primary-base` in light mode.** It only exists in the dark theme.
- **Dark mode needs its own, lighter primary.** Reusing the light value usually fails contrast on the dark background.

## Contrast requirements

The primary is used for link text, so it has to be readable on the page background.

| Mode | Check the primary against | Minimum |
| --- | --- | --- |
| Light | White (`#ffffff`) | 4.5:1 |
| Light | The table-stripe tint, if links appear in striped tables | 4.5:1 |
| Dark | Page background (`#17212b`) | 4.5:1 |
| Dark | The active-item wash (the primary at 15% over the page) | 4.5:1 |

Posit's palette has a scale for each hue (50–950).
A good starting point is step 700 for the light primary and step 300 or 400 for the dark primary.
The product's logo color is often too light to use as-is on white (Workbench's logo green, `#72994e`, is 3.29:1), which is why the light primary is a darker step of the same hue.

Worked example, Workbench (all from the Posit green scale):

| Role | Hex | Palette step | Contrast |
| --- | --- | --- | --- |
| Logo green | `#72994e` | green-500 | 3.29:1 on white |
| Light `$primary` | `#496331` | green-700 | 6.75:1 on white |
| Dark `$primary` | `#adbf99` | green-300 | 8.29:1 on `#17212b` |
| Dark `$primary-base` | `#72994e` | green-500 | washes only |

## What a product repo ends up with

```text
_quarto.yml          # logo, logo-alt, title, and the theme file list
product-light.scss   # $primary for light mode
product-dark.scss    # $primary and $primary-base for dark mode
images/logo-<product>.svg
```

## Checking your work

1. Render or preview the site and look at it in both color modes.
2. Confirm the navbar logo, the link color, the active sidebar item and the dividers use the product color.
3. Measure link text in both modes against the table above.
