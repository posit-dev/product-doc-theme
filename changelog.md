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
