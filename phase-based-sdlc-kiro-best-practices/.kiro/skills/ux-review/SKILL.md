---
name: ux-review
description: Run UX review checklist for banking user flows, validate WCAG accessibility compliance, and assess customer interface design
---

# UX Review Skill

## When to Use
Invoke when reviewing wireframes, user flows, or UX designs for banking customer-facing applications.

## Banking UX Principles
1. **Trust**: Clear, professional design that inspires confidence
2. **Clarity**: Financial information must be unambiguous
3. **Accessibility**: WCAG 2.1 AA minimum for all customer interfaces
4. **Security perception**: Visible security indicators (lock icons, session timers)
5. **Error prevention**: Confirmation dialogs for irreversible financial actions

## Review Checklist
- [ ] User flow covers happy path and all error states
- [ ] Financial amounts always show currency code
- [ ] Confirmation step before any money movement
- [ ] Session timeout warning at 2 minutes before expiry
- [ ] Keyboard navigation works for all interactive elements
- [ ] Color contrast ratio ≥ 4.5:1 for all text
- [ ] Screen reader compatible (ARIA labels, semantic HTML)
- [ ] Mobile responsive (320px minimum viewport)
- [ ] Loading states for all async operations
- [ ] Empty states designed (no accounts, no transactions)

## Banking-Specific UX Patterns
- Account selector: show account name + last 4 digits + balance
- Transaction list: date, description, amount (color-coded debit/credit), running balance
- Transfer flow: source → amount → destination → review → confirm → receipt
- Error messages: never expose internal system details to customers
