---
inclusion: fileMatch
fileMatchPattern: ["**/*.tsx", "**/*.jsx", "**/*.ts", "frontend/**", "src/components/**"]
---
## Banking Frontend Standards

### React 18 + TypeScript Strict Mode
- All components must be functional components with TypeScript
- Props interfaces: prefix with component name (AccountCardProps, TransactionListProps)
- Use React.memo() for components receiving stable props in lists
- Error boundaries required around every route-level component

### Component Patterns
- Presentational components: frontend/src/components/ (no business logic)
- Container components: frontend/src/pages/ (data fetching, state)
- Custom hooks: frontend/src/hooks/ (reusable stateful logic)
- API calls only in services layer: frontend/src/services/

### State Management (Zustand)
- One store per domain: useAccountStore, useTransactionStore, useAuthStore
- Never store sensitive data (tokens, PII) in client-side state
- Use selectors to prevent unnecessary re-renders

### Accessibility (WCAG 2.1 AA)
- All interactive elements must be keyboard navigable
- Form inputs require associated labels (htmlFor/id)
- Color contrast ratio: minimum 4.5:1 for text
- Screen reader announcements for dynamic content changes
- Focus management on route transitions

### Security
- Sanitize all user inputs before rendering (DOMPurify)
- No dangerouslySetInnerHTML unless explicitly approved
- CSP-compliant: no inline scripts or styles
- Token storage: httpOnly secure cookies only — never localStorage

### Money Display
- Always show currency symbol and code: S$1,000.00 SGD
- Use Intl.NumberFormat for locale-aware formatting
- Right-align monetary values in tables
