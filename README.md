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

format:
  posit-docs-html: default
```

> [!WARNING]
> If you use `format: html` to perform any modifications to pages or
> directories, rewrite those settings in terms of `format: posit-docs-html`.


### Additional configuration entries

The following entries may be unique to each product. Please review the following and make manual updates to your project, as required.

#### Navbar

Use the following `website.navbar.right` entries in your `_quarto.yml`,
merging with other entries if you have them:

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
