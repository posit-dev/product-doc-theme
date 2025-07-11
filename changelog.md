# v8.0.0

* Bumps Quarto version to pre-release `1.8.13`
* Removes unnecessary CSS/SCSS that is now natively supported by Quarto
* New "phase 2" dark theme look and feel
* Toast alert for version of docs viewing option added
* Footer and navbar entries adjusted/removed

# v7.0.1

* Corrects the version in the `_extensions` file

# v7.0.0

* Bumps quarto version
* Removes GTM and Cookie Consent from theme

# v6.1.0

* Bumps `env` `CURRENT_YEAR=2025`
* Removes `display:none` footer style that hides footer below 1200px

# v6.0.1

* Bumps version in `_extensions`

# v6.0.0

* Adds Cookie Consent prompt and styles to theme (Posit requirement)

# v5.1.1

* Updated README with new patch version
* Updated extension version (failed to bump in v5.1.0)

# v5.1.0

* Corrected several theme issues identified in Connect docs product testing.

# v5.0.1

* Removed cookie consent added by default
* Updated README to provide additional direction for Google Analytics implementation due to lack of cookie consent

# v5.0.0

* Bumped minimum Quarto version requirement to `quarto-required: ">=1.5.57"`
* Fixed inline-code in headings style
* Fixed footer wrap (temp fixed) to hide footer once window hits a max-size
* Disabled Google Analytics by default (new sites cannot have GA w/out cookie consent)
* Adjusted font color, size, weight based on recommendations
* Ajusted navbar font styling.

# v4.0.2

* Fixed dark theme copy button "Copied" feedback that wasn't legible
* Fixed dark theme code block without language identifier (unreadable)
* Improved dark theme search window overlay styles
* Fixed dark theme selected tabset is now more distinguishable

# v4.0.1

* Fix path problem with callout icons by including them as inline Base64 data
* Add `_posit-colors.scss` file that is shared across style sheets

# v4.0.0

* Add Posit dark mode theme
* Resolves Callout colors issue (#57)
* Fixed several style issues in default theme
* Fixed several accessibility issues

Known issue:

* Dark mode reloads cause flashing (Quarto has an open issue with plans to address in v1.5 or v1.6)

# v3.1.0

* Add alt-text to footer logos/icons
* Navigation bar:
    * Correct the contrast for navigation bar text between color and background
    * Right menu drop-down: Adds `aria-label` to resolve focusable descendants `aria-hidden="true"` which prevented interactive elements from being available to users of assistive technologies.

# v3.0.0

* (Breaking) Automatically configure analytics. Projects no longer need a copy
  of `_analytics.html` or the `analytics.google` entry in `_variables.yml`

# v2.0.1

* Adjust body letter spacing
* Adjust sidebar and TOC style
* Adjust list style

# v2.0.0

* (Breaking) Remove `posit-docs-html` and have the `posit-docs` project type
  directly modify the `html` format

# v1.2.0

* Expanded example site to demonstrate multiple pages, callouts, sidebar, and analytics
* Remove `website.sidebar` from the extension
* Configure search copy button and item context
* Specify `posit-docs-html` as the default theme when using the `project.type: posit-docs`
* Style `<small>` in the navbar; used for product version

# v1.1.0

* Update instructions and theme inclusions
* Footer must be configured when used
* Navbar should be inherited

# v1.0.0

Initial release
