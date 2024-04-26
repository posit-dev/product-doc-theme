
name: Accessibility
description: Report an accessibility issue or request.
title: "[Accessibility]: "
labels: ["accessibility"]
body:
  - type: input
    id: link
    attributes:
      label: Link(s) to the documentation:
      description: Add links to the documentation for this request, if applicable.
      placeholder: ex. https://docs.posit.co/previous-versions/
    validations:
      required: false
  - type: textarea
    id: accessibility-details
    attributes:
      label: Description of accessibility issue:
      description: Give as much information about the bug (screenshots are helpful).
    validations:
      required: true
  - type: textarea
    id: accessibility-tool
    attributes:
      label: Accessibility reporting/tool:
      description: Please list what accessibility tool you used to identify the issue (i.e., Lighthouse via Google Developer Tools).
    validations:
      required: true
  - type: textarea
    id: solution
    attributes:
      label: Solution:
      description: If you know how to fix this accessibility issue, please provide the steps/resources/etc., here:
    validations:
      required: false
  - type: textarea
    id: add-info
    attributes:
      label: Additional info:
      description: Additional information, such as related GH issues or PRs, additional resources, etc.
    validations:
      required: false
