# product-doc-theme

Shared theme for Posit product documentation

## Usage

**!!! WARNING: Cookie Consent will be managed by GTM (not the theme) in v7.0.1 of the theme. Please check with Ashley Henry prior to bumping your theme to latest (v7.0.1) so WebOps can opt the site in for tracking.**

First, install the extension:

```bash
quarto add posit-dev/product-doc-theme@v7.0.1
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
        aria-label: 'Link to Posit Support'
        href: "https://support.posit.co/hc/en-us"
      - text: '<a href="#" id="open_preferences_center" title="Manage your cookie preferences"><i class="bi bi-cookie"></i></i></a>'
        aria-label: 'Cookie Prefs'
      - icon: lightbulb-fill
        aria-label: 'Link to Posit Solutions'
        href: "https://solutions.posit.co/"
      - text: "<img alt='Link to main Posit site' src='/_extensions/posit-docs/assets/images/posit-icon-fullcolor.svg' id='footer-right-posit-logo'>"
        href: "https://posit.co/"
```

Make the following modifications:

-   **Product name:** Replace the `PRODUCT` placeholder with the product name.

-   **Product version:** Adapt the `PRODUCT_VERSION` variable for your product
    based on how that information is made available. The example project gets
    a default environment variable value from the
    [`_environment`](https://quarto.org/docs/projects/environment.html) file.
    
    You may need to dynamically define `PRODUCT_VERSION` before rendering your
    documentation.
    
    ```bash
    export PRODUCT_VERSION=$(cat version.txt)
    ```

-   **Copyright:** Copyright dates are represented as a range from the year of
    first product release until now. Adapt the `CURRENT_YEAR` variable for
    your product and how that information is made available. The example
    project gets a default environment variable value from the
    [`_environment`](https://quarto.org/docs/projects/environment.html) file.

    You may need to dynamically define `CURRENT_YEAR` before rendering your
    documentation.
    
    ```bash
    export CURRENT_YEAR=$(date "+%Y")
    ```

-   **Images:** Copy the two images from the extension into your project and update the `src` paths.

    For example, you may have a top-level `images` directory:

    ```bash
    cp _extensions/posit-dev/posit-docs/assets/images/posit-guide-ltmd.svg images
    cp _extensions/posit-dev/posit-docs/assets/images/posit-icon-fullcolor.svg images
    ```

    These images are also available [from
    GitHub](https://github.com/posit-dev/product-doc-theme/tree/main/_extensions/posit-docs/assets/images).

By copy/pasting and editing these entries into your project's yml, those entries will overwrite 1:1 entries in the `_extension.yml`.

## Development

If you are modifying this extension, use Quarto to preview your changes
against the sample project defined here.

```bash
quarto preview
```

### Release

To release a new version of this theme:

1.  Make sure that the extension declares the target version and documents its
    changes.

    1.  Update
        [`README.md`](https://github.com/posit-dev/product-doc-theme/blob/main/README.md);
        installation instructions reference the latest release version.
    1.  Update
        [`_extensions/posit-docs/_extension.yml`](https://github.com/posit-dev/product-doc-theme/blob/main/_extensions/posit-docs/_extension.yml);
        the extension declares its version.
    1.  Update
        [`changelog.md`](https://github.com/posit-dev/product-doc-theme/blob/main/changelog.md);
        make sure recent changes are announced.

    Commit and merge both changes to `main`.

2.  Tag the target commit and push the tag.

    ```bash
    git tag -a v1.1.0 -m 'Release 1.1.0'
    git push origin v1.1.0
    ```

3.  Create a GitHub release from [that tag](https://github.com/posit-dev/product-doc-theme/tags).


## Additional resources

- [bslib](https://github.com/rstudio/bslib/)
- [Quarto](https://quarto.org/)
- [Bootstrap](https://getbootstrap.com/docs/5.0/getting-started/introduction/)
