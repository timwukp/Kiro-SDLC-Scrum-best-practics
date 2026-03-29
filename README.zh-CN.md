# Kiro IDE 最佳實踐：階段式 SDLC vs 衝刺式 DevSecOps

[English](README.md) | [中文](README.zh-CN.md)

開箱即用的 [Kiro IDE](https://kiro.dev) 配置，適用於企業軟體開發團隊。[Kiro](https://kiro.dev) 是一款 AI 驅動的 IDE，透過 Steering 檔案、Hooks、Skills、Subagents 和 MCP 整合，將專案標準直接嵌入開發工作流程。

同一個企業專案的兩種方法 — 選擇適合你團隊的方式：

| | 階段式 SDLC | 衝刺式 DevSecOps |
|---|---|---|
| **適合** | 線性階段和專業角色分工的團隊 | 跨職能開發者的 Scrum 團隊 |
| **工作流程** | 需求 → 設計 → 開發 → 測試 → 部署 | 兩週衝刺：計劃 → 編碼 → 掃描 → 測試 → 發布 → 監控 |
| **安全** | 測試階段（接近尾聲） | 每個衝刺、每次提交（左移安全） |
| **安全責任** | 安全工程師團隊 | 每個人 — 每位開發者都是「安全開發者」 |
| **AI 方式** | AI 分別協助各角色 | AI 作為「數位隊友」— 安全掃描分類、威脅建模模板、部署檢查清單 |
| **發布節奏** | 所有階段完成後 | 每個衝刺至少一次 |
| **資料夾** | [`phase-based-sdlc-kiro-best-practices/`](./phase-based-sdlc-kiro-best-practices/) | [`sprint-based-devsecops-kiro-best-practices/`](./sprint-based-devsecops-kiro-best-practices/) |

## 前置需求

- 已安裝 [Kiro IDE](https://kiro.dev)
- Git
- Node.js 18+（用於 `npx` — MCP 伺服器需要）
- 一個要套用配置的專案（或直接獨立探索 — 見下方安裝步驟）

## 各配置包含內容

### [phase-based-sdlc-kiro-best-practices/](./phase-based-sdlc-kiro-best-practices/)
階段式 SDLC 方法，按 5 個階段的 14 個角色組織。

| 元素 | 數量 | 重點 |
|------|------|------|
| Steering | 13 | 按角色：BA、架構師、前端、後端、QA、DevOps、SRE、DBA |
| Subagents | 14 | 每個 SDLC 角色一個（requirements-validator、backend-builder、test-runner 等） |
| Skills | 15 | requirements-gathering、sprint-planning、code-standards、threat-modeling、deployment-checklist |
| Hooks | 10 | 憑證防護、生產環境寫入鎖定、DB 寫入防護、編碼標準、資料駐留防護、範圍審計 |
| Scripts | 8 | 用於確定性執行的 Shell 腳本 |
| 合規文件 | 7 | DR 計劃、滲透測試、供應商風險登記、董事會報告、SIEM、威脅建模流程 |

### [sprint-based-devsecops-kiro-best-practices/](./sprint-based-devsecops-kiro-best-practices/)
DevSecOps + Scrum 方法，AI 作為數位隊友。

| 元素 | 數量 | 重點 |
|------|------|------|
| Steering | 17 | Scrum 指南原則 + DevSecOps：三大支柱、衝刺目標制定、INVEST、看板流量指標、Scrum Master 六種姿態、殭屍 Scrum 反模式、UX 雙軌 |
| Subagents | 15 | Scrum 專用：security-champion、threat-modeler、pipeline-builder + 安全感知 code-reviewer |
| Skills | 14 | threat-modeling、security-story-writing、chaos-security-testing、sprint-security-review、retro-pipeline-review |
| Hooks | 10 | 相同執行機制 + Security Self-Heal Check、資料駐留防護、範圍審計 |
| Scripts | 7 | 用於確定性執行的 Shell 腳本 |
| 合規文件 | 6 | DR 計劃、滲透測試、供應商風險登記、董事會報告、SIEM 整合 |

## 共用內容（相同的企業應用場景，以銀行為範例）

兩套配置使用相同的企業應用場景：
- Java 21、Spring Boot 3.x、React 18 + TypeScript、Aurora PostgreSQL、AWS
- MAS TRM 2023、PCI-DSS v4.0、SOX、PDPA 合規
- 生產環境路徑保護（需 CAB 審批）
- 憑證洩漏防護（強制使用 AWS Secrets Manager）
- 資料庫變更防護（僅限 Flyway 遷移）
- 金額使用 BigDecimal、審計日誌、輸入驗證

## Kiro 五元素架構

兩套配置均基於 [Kiro 五元素架構](https://kiro.dev/docs/)：

| 元素 | 功能 | 核心原則 |
|------|------|----------|
| **Steering** (`.kiro/steering/`) | 告訴 Kiro 你的專案標準的上下文檔案，根據你正在處理的內容自動載入 | 軟性指導 — 指示 AI |
| **Hooks** (`.kiro/hooks/`) | 自動化護欄。Pre Tool Use hooks 可以阻止操作（如憑證寫入） | 硬性執行 — Shell Command hooks 100% 確定性，零成本 |
| **Skills** (`.kiro/skills/`) | 可重用工作流程。在聊天中輸入 `/threat-modeling` 獲取 STRIDE 模板 | 漸進式揭露 — 按需載入 |
| **Subagents** (`.kiro/agents/`) | 具有隔離上下文和工具的專業 AI 隊友。顯式調用或從 skill 流程中調用 | 隔離上下文、並行執行 |
| **MCP/Powers** (`.kiro/settings/mcp.json`) | 外部工具整合（GitHub、Jira、Snyk、Datadog） | 擴展 Kiro 的外部能力 |

核心規則：**Steering 指示；Hooks 執行。** 如果護欄必須 100% 執行，它必須是 Pre Tool Use Shell Command hook。

### Subagent 繼承行為

Kiro 五元素在自訂 Subagents（`.kiro/agents/*.md`）中的繼承行為：

| 元素 | 是否被 Subagent 繼承？ | 備註 |
|------|----------------------|------|
| **Steering** | 是（自動繼承） | 與主代理中的行為完全相同 |
| **MCP** | 選擇性啟用（`includeMcpJson: true`） | 預設：false |
| **Powers** | 選擇性啟用（`includePowers: true`） | 預設：false |
| **Hooks** | 否 | Hooks 僅在主代理中觸發 |
| **Specs** | 否 | Subagents 無法存取 Specs |
| **Skills（IDE）** | 否 | IDE 模式中無選擇性啟用機制 |
| **Skills（CLI）** | 選擇性啟用（`resources: ["skill://..."]`） | 僅限 CLI 的 URI 機制 |

> **架構備註：** Skills 必須由主代理（Main Agent）調度。Subagents 接收委派任務，而非 Skill 調用。

> **警告：** 請勿將 Skill 內容批量遷移至 Steering 檔案。Steering 在所有上下文中始終啟用（根據包含模式自動載入），而 Skills 使用漸進式揭露（按需載入）。混合使用會破壞兩者的設計目的。

詳細的技術工作流程圖（包含 hook 阻擋行為、subagent 繼承規則、測試驗證發現），請參閱 [kiro-workflow-diagram.md](./kiro-workflow-diagram.md)（[English](./kiro-workflow-diagram.md) | [中文](./kiro-workflow-diagram.zh-CN.md)）。


## 安裝

### 方式 A：套用到你的現有專案

```bash
# 1. 克隆此倉庫
git clone https://github.com/timwukp/Kiro-SDLC-Scrum-best-practics.git

# 2. 選擇你的方式並複製到你的專案
cp -r phase-based-sdlc-kiro-best-practices/.kiro /path/to/your-project/
# 或
cp -r sprint-based-devsecops-kiro-best-practices/.kiro /path/to/your-project/

# 3. 複製 AGENTS.md 到你的專案根目錄
cp phase-based-sdlc-kiro-best-practices/AGENTS.md /path/to/your-project/
# 或
cp sprint-based-devsecops-kiro-best-practices/AGENTS.md /path/to/your-project/

# 4. 複製參考文件和配置（建議）
cp -r phase-based-sdlc-kiro-best-practices/docs /path/to/your-project/
cp -r phase-based-sdlc-kiro-best-practices/config /path/to/your-project/

# 5. 設定 hook 腳本為可執行
chmod +x /path/to/your-project/.kiro/hooks/scripts/*.sh

# 6. 在 Kiro IDE 中開啟你的專案 — steering 自動載入
```

### 方式 B：獨立探索（不需要現有專案）

```bash
# 克隆並直接在 Kiro 中開啟以探索配置
git clone https://github.com/timwukp/Kiro-SDLC-Scrum-best-practics.git
cd Kiro-SDLC-Scrum-best-practics/sprint-based-devsecops-kiro-best-practices
chmod +x .kiro/hooks/scripts/*.sh

# 在 Kiro IDE 中開啟此資料夾
# 嘗試：在聊天中輸入 "/threat-modeling" 或 "/security-audit"
```

## 術語表

| 縮寫 | 全稱 |
|------|------|
| PO | Product Owner（產品負責人，Scrum 職責） |
| SM | Scrum Master（Scrum 職責） |
| BA | Business Analyst（業務分析師） |
| QA | Quality Assurance（品質保證） |
| SRE | Site Reliability Engineer（網站可靠性工程師） |
| DBA | Database Administrator（資料庫管理員） |
| CISO | Chief Information Security Officer（資訊安全長） |
| CAB | Change Advisory Board（變更諮詢委員會） |
| SDLC | Software Development Life Cycle（軟體開發生命週期） |
| ADR | Architecture Decision Record（架構決策記錄） |
| IaC | Infrastructure as Code（基礎設施即程式碼） |
| CDK | AWS Cloud Development Kit |
| MCP | Model Context Protocol（模型上下文協議） |
| SAST | Static Application Security Testing（靜態應用安全測試） |
| DAST | Dynamic Application Security Testing（動態應用安全測試） |
| STRIDE | Spoofing、Tampering、Repudiation、Information Disclosure、Denial of Service、Elevation of Privilege |
| OWASP | Open Worldwide Application Security Project（開放全球應用安全專案） |
| CVE | Common Vulnerabilities and Exposures（通用漏洞和暴露） |
| MFA | Multi-Factor Authentication（多因素認證） |
| JWT | JSON Web Token |
| DR | Disaster Recovery（災難復原） |
| RTO / RPO | Recovery Time Objective / Recovery Point Objective（復原時間目標 / 復原點目標） |
| SLO / SLI | Service Level Objective / Service Level Indicator（服務等級目標 / 服務等級指標） |
| DORA | DevOps Research and Assessment（DevOps 研究與評估指標） |
| MAS TRM | Monetary Authority of Singapore — Technology Risk Management（新加坡金融管理局 — 技術風險管理） |
| PCI-DSS | Payment Card Industry Data Security Standard（支付卡產業資料安全標準） |
| PDPA | Personal Data Protection Act（個人資料保護法，新加坡） |
| SOX | Sarbanes-Oxley Act（薩班斯-奧克斯利法案） |

## 測試與驗證

這些配置經過全面測試：23 個自動化 Shell 腳本（934 個斷言，96.47% 通過率）、28 個 skill 啟動評估（優化後 100%）、8 個負面啟動測試（零誤報）、4 個品質評估（安全掃描、合規審計、變更請求、銀行規則）。所有發現和修復記錄在 [Issue #1](https://github.com/timwukp/Kiro-SDLC-Scrum-best-practics/issues/1)。

## 參考資料

- [Kiro IDE](https://kiro.dev) — 下載和文件
- [Kiro 五元素架構](https://kiro.dev/docs/) — Steering、Hooks、Skills、Subagents、MCP/Powers
- [2020 Scrum 指南](https://scrumguides.org/scrum-guide.html) — Scrum 方法的基礎
- [Kiro Powers 市場](https://kiro.dev/powers/) — 40+ 官方整合

## 授權

MIT — 可自由調整用於你的組織。
