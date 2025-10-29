# product-doc-theme

[![Netlify Preview Status](https://api.netlify.com/api/v1/badges/45bb8138-6550-47eb-8b46-d94b40c14a01/deploy-status)](https://app.netlify.com/projects/product-doc-theme/deploys)

Shared theme for Posit product documentation

## Usage

**!!! WARNING: Cookie Consent will be managed by GTM (not the theme) in v7.0.1 of the theme. Please check with Ashley Henry prior to bumping your theme to latest (v7.0.1) so WebOps can opt the site in for tracking.**

First, install the extension:

```bash
quarto add posit-dev/product-doc-theme@v8.1.0
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

**For existing sites**

If you have `website.navbar.right` entries in your `_quarto.yml`, you may have to
merge the following with the existing entries in your `_quarto.yml`.

```
website:
  navbar:
    right:
      - text: "Help"
        menu:
          - text: "docs.posit.co"
            href: "https://docs.posit.co"
          - text: "Posit Support"
            href: "https://support.posit.co/hc/en-us/"
```
Once merged, you should manually disable these entries by commenting them out in the `_extension.yml`.
This should be avoided, if possible.

#### Footer

Use the following `website.page-footer` in your `_quarto.yml`:

```
website:
  page-footer:
    left:
      - text: <img src="/images/posit-logos-2024_horiz-full-color.svg" alt="Posit" width="65px" class="light-content posit-footer-logo"><img src="/images/posit-logo-fullcolor-TM.svg" alt="Posit" width="65px" class="dark-content posit-footer-logo">
        href: "https://posit.co"
      - Copyright &copy; 2000-{{< env CURRENT_YEAR >}} Posit Software, PBC. All Rights Reserved.
    center: |
      Posit PRODUCT {{< env PRODUCT_VERSION >}}
    right:
      - text: '<a href="#" id="open_preferences_center" title="Update cookie preferences">
              <img src="/images/cookie.svg" alt="Cookie Preferences" class="light-content" style="width: 1em; height: 1em;">
              <img src="/images/cookie-copy.svg" alt="Cookie Preferences" class="dark-content" style="width: 1em; height: 1em;">
           </a>'
        aria-label: 'Cookie Prefs'
      - text: Support
        aria-label: 'Link to Posit Support'
        href: "https://support.posit.co/hc/en-us"
      - text: Posit Docs
        aria-label: 'Link to Posit Docs'
        href: "https://docs.posit.co"
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
    cp _extensions/posit-dev/posit-docs/assets/images/cookie.svg images
    cp _extensions/posit-dev/posit-docs/assets/images/cookie-copy.svg images
    cp _extensions/posit-dev/posit-docs/assets/images/posit-logo-fullcolor-TM.svg images
    cp _extensions/posit-dev/posit-docs/assets/images/posit-logos-2024_horiz-full-color.svg images
    ```

    These images are also available [from
    GitHub](https://github.com/posit-dev/product-doc-theme/tree/main/_extensions/posit-docs/assets/images).

By copy/pasting and editing these entries into your project's yml, those entries will overwrite 1:1 entries in the `_extension.yml`.

### Version toast

Commonly, our users are unaware of the documentation version that they are viewing. This causes confusion, ultimately resulting in support tickets. A visual prompt displaying the documentation for our user may deflect support inquiries.

Bootstrap 5+ provides a [Toast](https://getbootstrap.com/docs/5.0/components/toasts/) component that displays a message to the user and auto-closes after about 10 seconds.

Our version toast displays the current product version and provides a link to the latest release of the documentation. This toast should be modified and added to your product documentation ASAP. The `_version-toast.html` is included in the theme directory and can be copied to your project. Enable the toast by adding the following to your `_quarto.yml`:

```
format:
  html:
    include-in-header: 
      - _version-toast.html
```

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
