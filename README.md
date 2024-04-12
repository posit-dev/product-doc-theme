# product-doc-theme

Shared theme for Posit product documentation

## Usage

First, install the extension:

```bash
quarto add posit-dev/product-doc-theme
```

Next, update your project type and format in `_quarto.yml`:

```yaml
project:
  title: "Posit Documentation"
  type: posit-docs
```

### Additional configuration entries

The following entries may be unique to each product. Please review the following and make manual updates to your project, as required.

#### Navbar

If you have `website.navbar.right` entries in your `_quarto.yml`,
merge the following with the existing entries:

```
website:
  navbar:
    right:
      - icon: "list"
        menu:
          - text: "docs.posit.co"
            href: "https://docs.posit.co"
          - text: "Posit Support"
            href: "https://support.posit.co/hc/en-us/"
```

#### Footer

Use the following `website.page-footer` in your `_quarto.yml`:

```
website:
  page-footer:
    left: |
      Copyright &copy; 2000-{{< env CURRENT_YEAR >}} Posit Software, PBC. All Rights Reserved.
    center: |
      Posit PRODUCT {{< env PRODUCT_VERSION >}}
    right:
      - icon: question-circle-fill
        href: "https://support.posit.co/hc/en-us"
      - icon: lightbulb-fill
        href: "https://solutions.posit.co/"
      - text: "<img src='/images/posit-guide-ltmd.svg' id='footer-right-logo'>"
        href: "https://docs.posit.co/"
      - text: "<img src='/images/posit-logo-black-TM.svg' id='footer-right-posit-logo'>"
        href: "https://posit.co/"
```

Make the following modifications:

-   **Copyright:** Copyright dates are represented as a range from the year of
    first product release until now. Adapt the example for your product and
    how that information is made available.

-   **Product name:** Replace the `PRODUCT` placeholder with the product name.

-   **Product version:** Adapt the version for your product based on how that
    information is made available.

-   **Images:** Copy the two images from the extension into your project.

    For example, you may have a top-level `images` directory:

    ```bash
    cp _extensions/posit-dev/posit-docs/assets/images/posit-guide-ltmd.svg images
    cp _extensions/posit-dev/posit-docs/assets/images/posit-logo-black-TM.svg images
    ```

    These images are also available [from
    GitHub](https://github.com/posit-dev/product-doc-theme/tree/main/_extensions/posit-docs/assets/images).

By copy/pasting and editing these entries into your project's yml, those entries will overwrite 1:1 entries in the `_extension.yml`.

#### Analytics

Configure Google Analytics using a snippet like the following.

```yaml
format:
  html:
    include-in-header: _analytics.html
```

This uses the [`_analytics.html`](_analytics.html) and
[`_variables.yml`](_variables.yml) files in the example project. For Posit
product documentation hosted on <https://docs.posit.co/>, copy these files
into your project.

## Development

If you are modifying this extension, use Quarto to preview your changes
against the sample project defined here.

```bash
quarto preview
```

### Release

To release a new version of this theme:

1.  Make sure that the extension declares the target version. Update
    [`_extensions/posit-docs/_extension.yml`](https://github.com/posit-dev/product-doc-theme/blob/main/_extensions/posit-docs/_extension.yml),
    then commit and merge that change to `main`.

2.  Tag the target commit and push the tag.

    ```bash
    git tag -a v1.1.0 -m 'Release 1.1.0'
    git push origin v1.1.0
    ```

3.  Create a GitHub release from [that tag](https://github.com/posit-dev/product-doc-theme/tags).
