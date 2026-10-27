# product-doc-theme

Shared theme for Posit product documentation

> [!NOTE]
> This is the **`q2` branch**: the theme for sites rendered with Quarto 2 (`q2`).
> Quarto 1 sites use the `main` branch.
> See [Quarto 2 branch](#quarto-2-branch).

## Usage

First, install the extension from this branch:

```bash
q2 add posit-dev/product-doc-theme@q2
```

Next, update your project type and format in `_quarto.yml`:

```yaml
project:
  title: Posit Documentation
  type: posit-docs
```

### Additional configuration entries

The following entries may be unique to each product.
Please review the following and make manual updates to your project, as required.

#### Navbar

**For existing sites**

If you have `website.navbar.right` entries in your `_quarto.yml`, you may have to merge the following with the existing entries in your `_quarto.yml`.

```yaml
website:
  navbar:
    right:
      - text: Help
        menu:
        - text: docs.posit.co
          href: https://docs.posit.co
        - text: Posit Support
          href: https://support.posit.co/hc/en-us/
```
Once merged, you should manually disable these entries by commenting them out in the `_extension.yml`.
This should be avoided, if possible.

##### Product logos

The extension sets a default navbar logo (`posit-icon-fullcolor.svg`).
Products with a product-specific logos should override this in `_quarto.yml`.

**Applies to: Workbench, Connect, Package Manager, Chronicle, Connect Cloud, Posit AI**

```yaml
website:
  navbar:
    logo: images/your-product-mark.svg
    logo-alt: Your Product documentation
```

The extension does not set a height for the navbar logo.
Add the following to your site stylesheet so the logo renders at a consistent size:

```css
.navbar-brand-logo .navbar-logo {
    height: 28px;
    max-height: 28px;
}
```

##### Sites with product logos: title

These sites with product logos should not include the "Posit" prefix in their website title.

In your `_quarto.yml`:

```yaml
project:
  title: Connect Documentation
```

Not:

```yaml
project:
  title: Posit Connect Documentation
```

#### Footer

Use the following `website.page-footer` in your `_quarto.yml`:

```yaml
website:
  page-footer:
    left:
      - text: '![Posit](/images/posit-logos-2024_horiz-full-color.svg){.light-content .posit-footer-logo width="65px"}![Posit](/images/posit-logo-fullcolor-TM.svg){.dark-content .posit-footer-logo width="65px"}'
        href: "https://posit.co"
      - Copyright &copy; 2000-{{< env CURRENT_YEAR >}} Posit Software, PBC. All Rights Reserved.
    center: |
      Posit PRODUCT {{< env PRODUCT_VERSION >}}
    right:
      - text: '[![Cookie Preferences](/images/cookie.svg){.light-content style="width: 1em; height: 1em;"}![Cookie Preferences](/images/cookie-copy.svg){.dark-content style="width: 1em; height: 1em;"}](#){#open_preferences_center title="Update cookie preferences"}'
        aria-label: 'Cookie Prefs'
      - text: Support
        aria-label: 'Link to Posit Support'
        href: "https://support.posit.co/hc/en-us"
      - text: Posit Docs
        aria-label: 'Link to Posit Docs'
        href: "https://docs.posit.co"
```

The footer images are written as markdown images, not raw `<img>` tags.
Quarto 2 copies markdown images into the rendered site and rewrites their paths for each page; it does not look inside raw HTML, so an image referenced only from an `<img>` tag is never copied.
A leading `/` means "relative to the project root".

The cookie-preferences entry is a markdown link with an id: it renders as `<a href="#" id="open_preferences_center" …>`, which the consent manager and the theme's `_analytics.html` script look for.
Keep the id unchanged.

Make the following modifications:

- **Product name:** Replace the `PRODUCT` placeholder with the product name.

- **Product version:** Adapt the `PRODUCT_VERSION` variable for your product based on how that information is made available.
  The example project gets a default environment variable value from the [`_environment`](https://quarto.org/docs/projects/environment.html) file.

  You may need to dynamically define `PRODUCT_VERSION` before rendering your documentation.

    ```bash
    export PRODUCT_VERSION=$(cat version.txt)
    ```

- **Copyright:** Copyright dates are represented as a range from the year of first product release until now.
  Adapt the `CURRENT_YEAR` variable for your product and how that information is made available.
  The example project gets a default environment variable value from the [`_environment`](https://quarto.org/docs/projects/environment.html) file.

  You may need to dynamically define `CURRENT_YEAR` before rendering your documentation.

    ```bash
    export CURRENT_YEAR=$(date "+%Y")
    ```

-   **Images:** Copy the four images from the extension into your project and update the image paths.

    For example, you may have a top-level `images` directory:

    ```bash
    cp _extensions/posit-dev/posit-docs/assets/images/cookie.svg images
    cp _extensions/posit-dev/posit-docs/assets/images/cookie-copy.svg images
    cp _extensions/posit-dev/posit-docs/assets/images/posit-logo-fullcolor-TM.svg images
    cp _extensions/posit-dev/posit-docs/assets/images/posit-logos-2024_horiz-full-color.svg images
    ```

    These images are also available [from
    GitHub](https://github.com/posit-dev/product-doc-theme/tree/q2/_extensions/posit-docs/assets/images).

By copy/pasting and editing these entries into your project's yml, those entries will overwrite 1:1 entries in the `_extension.yml`.

### Version toast

Our version toast displays the current product version and provides a link to the latest release of the documentation.
This toast should be modified and added to your product documentation.
The `_version-toast.html` is included in the theme directory and can be copied to your project.
Enable the toast by adding the following to your `_quarto.yml`:

```yaml
format:
  html:
    include-in-header:
      - _version-toast.html
```

## Quarto 2 branch

The `q2` branch carries the theme for Quarto 2.
It differs from `main` where Quarto 1 and Quarto 2 need different spellings; the extension itself (`_extensions/posit-docs`) is meant to stay in step with `main`.

Differences from `main`:

- The README and the example site write footer images as markdown images instead of raw `<img>` tags (see [Footer](#footer)).
- `example/grid.qmd` wraps its `<style>` block in a ```` ```{=html} ```` block; Quarto 2 does not accept a bare top-level `<style>` block.
- `example/_quarto.yml` marks the `<small>` in `website.title` as raw HTML (`` `<small>`{=html} ``), which Quarto 2 otherwise warns about on every page.

To bring changes from `main` across, merge `main` into `q2`.

> [!IMPORTANT]
> Never create a git **tag** named `q2`.
> Both `quarto add` and `q2 add` try a tag before a branch, so a `q2` tag would silently replace the branch for anyone installing `@q2`.

## Development

The extension lives in `_extensions/posit-docs`.
The `example` directory holds a sample site that exercises the theme; its `_extensions` entry is a symlink back to the extension source, so a render there picks up your edits.

To preview your changes against the sample site:

```bash
cd example
q2 preview
```

### Pull request previews

Every pull request renders the sample site and publishes it to this repository's GitHub Pages site under `/pr-preview/pr-<number>/`.
A bot comment on the pull request links to it.
The preview is removed when the pull request closes.

Pages serves the `gh-pages` branch, which the [pr-preview action](https://github.com/rossjrw/pr-preview-action) writes to.

Record your changes in the `Unreleased` section at the top of [`changelog.md`](https://github.com/posit-dev/product-doc-theme/blob/main/changelog.md) as part of the pull request that makes them, adding the section if it is not there.
Writing the entry alongside the change is easier than reconstructing it from the commit log at release time, and it leaves the release with only a heading to rename.

### Release

To release a new version of this theme:

1. Make sure that the extension declares the target version and documents its
    changes.

    1. Update [`_extensions/posit-docs/_extension.yml`](https://github.com/posit-dev/product-doc-theme/blob/main/_extensions/posit-docs/_extension.yml); the extension declares its version.
    2. Update [`changelog.md`](https://github.com/posit-dev/product-doc-theme/blob/main/changelog.md); make sure recent changes are announced.

    Commit and merge both changes to `main`.

2. Tag the target commit and push the tag.

    ```bash
    git tag -a v1.1.0 -m 'Release 1.1.0'
    git push origin v1.1.0
    ```

3. Create a GitHub release from [that tag](https://github.com/posit-dev/product-doc-theme/tags).

## Additional resources

- [bslib](https://github.com/rstudio/bslib/)
- [Quarto](https://quarto.org/)
- [Bootstrap](https://getbootstrap.com/docs/5.0/getting-started/introduction/)
