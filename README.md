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

The following entries are unique to each product.

- Copyright: Since the product copyright dates should be represented as a range and is dependent on the product, override the entry in your project's `quarto.yml` file.
- Posit Product version: Since some products choose to autmate this entry with a version variable, it should be added/configured in your project's `quarto.yml` file.

Example:

```
page-footer:
        left: |
          <Copyright placeholder - replace in project>
        center: |
          <Posit Product version - replace in project> 
```

By copy/pasting and editing these entries into your project's yml, those entries will override 1:1 entries in the `_extension.yml`.