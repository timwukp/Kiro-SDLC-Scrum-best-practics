---
name: code-standards
description: Validate Java and TypeScript code against banking naming conventions, style rules, and quality standards
---

# Code Standards Skill

## When to Use
Invoke when reviewing code for standards compliance or setting up new modules.

## Java Standards (Google Java Style + Banking Extensions)
- Class names: PascalCase (AccountService, TransactionController)
- Methods: camelCase (getAccountBalance, processTransfer)
- Constants: UPPER_SNAKE_CASE (MAX_TRANSFER_AMOUNT, DEFAULT_CURRENCY)
- Packages: com.bank.{domain}.{layer} (com.bank.account.service)

## License Header (Required for all Java files)
```java
/*
 * Copyright (c) 2025 [Your Bank Name]. All rights reserved.
 * Licensed under the terms of your organization's software license.
 */
```

## TypeScript Standards
- Components: PascalCase (AccountCard.tsx, TransactionList.tsx)
- Hooks: camelCase with use prefix (useAccountBalance, useTransferForm)
- Types/Interfaces: PascalCase with descriptive suffix (AccountCardProps, TransferFormState)
- Constants: UPPER_SNAKE_CASE in dedicated constants files

## Import Ordering
1. Java standard library (java.*, javax.*)
2. Third-party libraries (org.*, com.*)
3. Internal packages (com.bank.*)
4. Static imports last

## Documentation Requirements
- All public classes: Javadoc with @author, @since
- All public methods: Javadoc with @param, @return, @throws
- Complex algorithms: inline comments explaining the "why"
- API endpoints: OpenAPI annotations (@Operation, @ApiResponse)
