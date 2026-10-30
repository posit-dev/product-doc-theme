#!/bin/bash

# Post-render script to copy Bootstrap CSS files to permanent names for CDN hosting

# Find the light theme CSS (not dark, not icons)
LIGHT_CSS=$(find _site/site_libs/bootstrap -name "bootstrap-*.min.css" ! -name "*dark*" ! -name "*icons*" | head -n 1)

# Find the dark theme CSS
DARK_CSS=$(find _site/site_libs/bootstrap -name "bootstrap-dark-*.min.css" | head -n 1)

# Copy to permanent names
if [ -n "$LIGHT_CSS" ]; then
  cp "$LIGHT_CSS" _site/posit-theme-light.css
  echo "✓ Copied light theme to _site/posit-theme-light.css"
else
  echo "✗ Light theme CSS not found"
  exit 1
fi

if [ -n "$DARK_CSS" ]; then
  cp "$DARK_CSS" _site/posit-theme-dark.css
  echo "✓ Copied dark theme to _site/posit-theme-dark.css"
else
  echo "✗ Dark theme CSS not found"
  exit 1
fi

echo "✓ Theme files ready for CDN upload"
