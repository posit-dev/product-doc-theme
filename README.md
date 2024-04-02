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

### Additional configuration entries

The following entries may be unique to each product. Please review the following and make manual updates to your project, as required.

#### Nav bar

If you have existing `navbar: right` entries in your project's `_quarto.yml`:

```
navbar:
   right:
```

Then, copy/paste the following into your project's `_quarto.yml` and then comment out these entries in the `posit-docs/_extension.yml`:

```
right:
  - icon: "list"
    menu:
      - text: "docs.posit.co"
        href: "https://docs.posit.co"
      - text: "Posit Support"
        href: "https://support.posit.co/hc/en-us/"
```

#### Footer

- **Copyright:** Since the product copyright dates should be represented as a range and is dependent on the product, override the entry in your project's `quarto.yml` file.
- **Posit Product version:** Since some products choose to autmate this entry with a version variable, it should be added/configured in your project's `quarto.yml` file.

Example:

```
page-footer:
        left: |
          <Copyright placeholder - replace in project>
        center: |
          <Posit Product version - replace in project> 
```

By copy/pasting and editing these entries into your project's yml, those entries will overwrite 1:1 entries in the `_extension.yml`.

- **Footer icons:** The following icons (assets) cause build errors. Additional steps need to be taken to resolve the errors and for the icons to be added to your site:
    - Copy the following assets from the `_extensions/posit-docs/assets/images/` directory to a directory within your local project:
        - `posit-guide-ltmd.svg`
        - `posit-logo-black-TM.svg`
    
    - In the `_extensions/posit-docs/_extension.yml`, update the following paths to point to the location of the assets within your local project:
          - text: "<img src='<path to assets>' id='footer-right-logo'>"
            href: https://docs.posit.co
          - text: "<img src='<path to assets>' id='footer-right-posit-logo'>"
            href: "https://posit.co"