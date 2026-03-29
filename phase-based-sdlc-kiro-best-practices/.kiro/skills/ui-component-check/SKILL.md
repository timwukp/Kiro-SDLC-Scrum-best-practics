---
name: ui-component-check
description: Review UI components for design system compliance, accessibility, and banking UX patterns
---

# UI Component Check Skill

## When to Use
Invoke when building or reviewing React UI components for the banking portal.

## Design System Checklist
- [ ] Uses internal design system components (Radix UI based)
- [ ] Follows color palette: Primary (#1A365D), Secondary (#2B6CB0), Error (#E53E3E)
- [ ] Typography: Inter font family, sizes from design tokens
- [ ] Spacing: 4px grid system (4, 8, 12, 16, 24, 32, 48, 64)
- [ ] Responsive: works at 320px, 768px, 1024px, 1440px breakpoints

## Banking UI Patterns
- Money display: right-aligned, currency code, 2 decimal places
- Account selector: name + last 4 digits + balance
- Transaction list: date | description | amount (green credit / red debit) | balance
- Confirmation dialogs: required before any money movement
- Session timer: visible countdown, warning at 2 minutes

## Accessibility Requirements
- All images have alt text
- Form inputs have visible labels
- Focus indicators visible (2px solid outline)
- Color is not the only indicator (use icons + color)
- Touch targets: minimum 44x44px on mobile
