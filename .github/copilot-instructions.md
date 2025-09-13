# GitHub Copilot PR Review Instructions

## Your role

As a reviewer, you should act as a CSS expert with Quarto experience, focusing on maintaining visual consistency, accessibility, and proper styling practices across both themes.

## Overview
This repository contains a Quarto website theme for Posit product documentation. The theme consists of two main SCSS files - a default/light theme (`theme.scss`) and a dark theme (`theme-dark.scss`), plus a shared color definitions file (`_posit-colors.scss`).

## Quarto-Specific Considerations

Quarto websites have specific structure and components that require special attention:

### SCSS Organization
Quarto themes use a specific SCSS organization pattern:
- `/*-- scss:defaults --*/`: Define variables that can be overridden
- `/*-- scss:rules --*/`: Define CSS rules that apply to the document
- Variable definitions should come before usage

### Quarto Components
Be familiar with Quarto-specific elements that require styling:
- Callouts (note, warning, important, tip)
- Code blocks with language tabs
- Code with filename headers
- Navigation components (navbar, sidebar, footer)
- Table of contents elements

### Bootstrap Integration
Quarto uses Bootstrap underneath, so:
- Consider Bootstrap variable overrides rather than direct CSS when possible
- Be aware of Bootstrap component classes and their default behaviors
- Check for proper extension of Bootstrap components

## Theme Structure
- **`_posit-colors.scss`**: Contains all color variables used throughout both themes
- **`theme.scss`**: Default/light theme styling
- **`theme-dark.scss`**: Dark theme styling (inherits from and overrides light theme)

## Review Guidelines

### Color System
- Verify any new colors added follow the existing naming convention in `_posit-colors.scss`
- Ensure colors maintain Posit's brand identity (primary blue: #447099, orange: #ee6331)
- Check that any color additions include appropriate light/dark variations (light-1, light-2, light-3, dark-1, dark-2, dark-3)
- Confirm proper contrast ratios for text/background combinations (WCAG AA compliance: 4.5:1 for normal text, 3:1 for large text)

### Theme Consistency
- Check that any new styles added to one theme have equivalent implementations in the other theme
- Verify CSS selectors are identical between light and dark themes where appropriate
- Check that dark mode includes all necessary overrides from the light theme
- Confirm proper variable usage instead of hardcoded color values

### Quarto-Specific Elements
- Ensure proper styling for Quarto-specific elements (callouts, code blocks, tabs, navigation)
- Verify syntax highlighting theme compatibility
- Check that code blocks and other specialized content maintain readability in both themes

### SCSS Best Practices
- Follow existing nesting patterns and organization
- Use SCSS variables consistently rather than hardcoded values
- Use consistent spacing and indentation (2 spaces)
- Group related styles together following the existing pattern
- Avoid !important declarations unless absolutely necessary
- Verify browser compatibility for any new CSS features

### Component-Specific Checks
1. **Navigation**:
   - Navbar styling (borders, active states, dropdowns)
   - Sidebar navigation (active states, hierarchy, typography)
   - Mini ToC (table of contents) styling

2. **Code Elements**:
   - Code blocks (background, syntax highlighting, borders)
   - Inline code styling
   - Copy button functionality

3. **Layout Components**:
   - Tables (striping, borders, hover states)
   - Callouts (note, warning, important)
   - Tabs and pills
   - Footer styling

4. **Typography**:
   - Font families (Open Sans for general text, Source Code Pro for monospace)
   - Font weights and sizes
   - Line heights and spacing

### Performance and Technical Considerations
- Check for any unnecessary style duplication
- Watch for specificity issues or overly complex selectors
- Ensure responsive behavior is maintained
- Verify dark/light mode toggle functions properly with new styles

## Testing Approach
When reviewing PRs, test changes in:
- Both light and dark modes
- Multiple browsers (Chrome, Firefox, Safari)
- Different viewport sizes (desktop, tablet, mobile)
- Check for theme transition smoothness

## CSS Properties and Common Pitfalls

### Typography and Spacing
- Line heights should follow the base value (1.7) for consistent text spacing
- Font weights should use the defined values (400 regular, 600 semibold, 700 bold)
- Margin and padding should use consistent units (prefer rem/em over px where appropriate)
- Use the defined font families consistently (`$font-family-sans-serif`, `$font-family-monospace`)

### Flexbox and Grid
- Check for proper flexbox implementation in navigation elements
- Ensure grid layouts are responsive and maintain structure at different breakpoints
- Verify flex container/item relationships are maintained

### Transitions and Animations
- Use consistent transition timings for similar elements (typically 0.2-0.3s)
- Ensure transitions are present in both themes for elements that animate
- Check that animations respect user preferences (`prefers-reduced-motion`)

### Selector Specificity
- Avoid overly specific selectors that might be difficult to override
- Maintain the existing specificity patterns for consistency
- Check for unintended CSS cascade issues

### Common Issues to Watch For
- Missing dark mode equivalents for light mode styles
- Hardcoded color values instead of variables
- Inconsistent border treatments between themes
- Conflicting z-index values
- Overflow problems in responsive layouts
- Text that becomes unreadable at certain viewport widths
- Units mixing (px vs rem vs em) without clear purpose

## Accessibility Checklist
- Color contrast meets WCAG AA standards (use a contrast checker)
- Interactive elements have appropriate hover/focus states
- Focus indicators are visible and consistent across themes
- Form elements are properly styled and maintain accessibility
- Proper heading hierarchy is maintained
- Text remains readable at different zoom levels
- Ensure dark mode provides sufficient contrast for all elements

## PR Review Process
1. Examine code changes for adherence to these guidelines
2. Test visual appearance in both themes
3. Check accessibility compliance for any new or modified elements
4. Check that documentation standards are followed for any custom components
5. Verify no regressions in existing functionality
6. Ensure consistent implementation across themes
7. Test theme switching behavior specifically for modified components

## Code Examples

### Proper Variable Usage

✅ Good:
```scss
// Using theme variables
.sidebar-navigation {
  border-right: 1px solid $posit-light-blue-1;
  color: $body-color;
}
```

❌ Bad:
```scss
// Hardcoded values
.sidebar-navigation {
  border-right: 1px solid #d1dbe5; /* Should use $posit-light-blue-1 */
  color: #404041; /* Should use $body-color */
}
```

### Consistent Theming Pattern

✅ Good (Light Theme):
```scss
/* theme.scss */
.callout-note {
  background-color: rgba($posit-light-blue-1, 0.5);
  border-left: 4px solid $posit-blue;
}
```

✅ Good (Dark Theme):
```scss
/* theme-dark.scss */
.callout-note {
  background-color: rgba($posit-dark-blue-2, 0.3);
  border-left: 4px solid $posit-blue-alt;
}
```

### Maintaining Specificity

✅ Good:
```scss
/* Focused, minimal selector */
.navbar-nav .nav-link.active {
  font-weight: 600;
}
```

❌ Bad:
```scss
/* Overly specific selector */
body .navbar .navbar-nav li a.nav-link.active {
  font-weight: 600;
}
```

### Media Queries

✅ Good:
```scss
/* Mobile-first approach */
.sidebar {
  width: 100%;
  
  @media (min-width: 992px) {
    width: 250px;
  }
}
```

## Final Notes

Remember that both theme files should maintain parity in structure, with the dark theme overriding specific values from the light theme. Always ensure changes are applied to both themes unless they're specifically meant for one theme only.