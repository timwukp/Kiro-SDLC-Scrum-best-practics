---
inclusion: fileMatch
fileMatchPattern: ["**/*.tsx", "**/*.jsx", "**/*.ts", "frontend/**", "src/components/**"]
---
## Banking Frontend Standards (Security-First UI)

### React 18 + TypeScript Strict Mode
- Functional components with TypeScript only
- Error boundaries on every route-level component
- Loading states for all async operations

### Security UX (Intuitive Security)
- MFA flows must be frictionless — don't make users bypass security
- Session timeout warning at 2 minutes before expiry
- Confirmation dialogs before any money movement
- Privacy settings easily accessible — not buried in menus
- Security indicators visible (lock icons, HTTPS badge)

### Client-Side Security
- Sanitize all user inputs (DOMPurify)
- No dangerouslySetInnerHTML unless explicitly approved
- CSP-compliant: no inline scripts or styles
- Token storage: httpOnly secure cookies only — never localStorage
- Never store PII in client-side state (Zustand stores)

### Money Display
- Always show currency symbol and code: S$1,000.00 SGD
- Use Intl.NumberFormat for locale-aware formatting
- Right-align monetary values in tables

### Accessibility (WCAG 2.1 AA)
- Keyboard navigable interactive elements
- Form inputs with associated labels
- Color contrast ratio ≥ 4.5:1
- Screen reader announcements for dynamic content
