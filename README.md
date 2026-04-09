# 🔴 金正恩Skill

## 🌟 为什么做这个？

很多 AI 会分析，但不会在高压力、低资源、多干扰环境下稳定推进任务：

- 主任务明明只有一个，却被许多次级目标分散注意力
- 外部工具一失效，就停在原地等待条件变好
- 任务拆解停留在“讨论语句”，而不是“动作命令”
- 检查节奏太慢，偏差积累到最后才暴露
- 做了很多事，却拿不出一个清晰、可见、可验证的阶段成果

这套 skill 的出发点，是把“极端集中型组织”的执行逻辑翻译成 AI 能用的工作纪律：

- **一个中心**：先锁定唯一主任务
- **一个口径**：所有子任务服务于总任务
- **内生优先**：默认外部依赖不稳定，先保本地可行路径
- **高频检阅**：用短周期纠偏，而不是等最后统一结算
- **战果先行**：优先拿出可展示、可验证、可汇报的成果点

---

## 🏗️ 方法结构

### ☀️ 总原则 —— 任务绝对化

AI 在开始前先回答一个问题：

**“当前唯一不能失败的任务是什么？”**

所有判断、工具调用、上下文窗口、时间预算，都优先服从这个任务。

---

### ⚙️ 第一层·组织哲学

#### 👑 单核指挥
只保留一个主目标、一个当前版本、一个对外结论。

#### 🧱 自力更生
默认外部依赖会迟到、失效或不可用；优先建设本地替代方案、降级路径、手工兜底方式。

#### 🌪️ 常态危机
把“资源稀缺、时间紧、信息不全”视为常态，流程为坏条件而设计。

---

### 🛠️ 第二层·工作方法

#### 📜 指令级拆解
把模糊讨论压缩成可执行命令：谁做、做什么、做到什么程度、先后顺序如何。

#### 🧪 高频检阅
用短周期检查目标偏差、资源偏差、质量偏差，而不是等到最后才检查。

#### 🔒 反馈封闭
只保留能改变决策的反馈；把噪音挡在系统外，把决策反馈拉进闭环。

---

### 🎖️ 第三层·行动战术

#### 🎯 资源锁仓
把最强工具、最大上下文、最高推理预算集中给主任务。

#### 🛖 最小生存栈
先搭出能运行、能证明、能续命的最小系统，而不是一开始追求完整体系。

#### 🚩 象征成果先行
优先制造一个清晰、可见、可汇报、可验证的成果点，用它稳住节奏、统一预期。

---

## 🗡️ 九大执行武器

| 执行武器 | 核心要义 | 适用场景 |
|---|---|---|
| 👑 单核指挥 | 一个中心、一个版本、一个当前结论 | 需求混乱、多人协作 |
| 🧱 自力更生 | 默认依赖失效，先保内生能力 | 工具受限、环境不稳 |
| 🌪️ 常态危机 | 为最坏条件设计流程 | 高压交付、信息不全 |
| 📜 指令级拆解 | 把讨论变成动作命令 | 拖延、任务过大 |
| 🧪 高频检阅 | 短周期纠偏，不等最后 | 长任务、易返工工作 |
| 🔒 反馈封闭 | 过滤噪音，只留决策反馈 | 意见过载、需求摇摆 |
| 🎯 资源锁仓 | 核心资源只服务主任务 | 多任务竞争 |
| 🛖 最小生存栈 | 先做最小可运行系统 | 从零启动、原型期 |
| 🚩 象征成果先行 | 先打可见战果 | 需要汇报、稳预期 |

---

## 📦 安装

### 系统要求

任何支持 Markdown skill / system prompt 注入的 AI 工具都可以使用：

- Claude Code
- Cursor
- Codex
- OpenCode
- 其他支持按需加载 Markdown skill 的 Agent 平台

### 方式一：本地仓库安装

```bash
git clone <your-repo-url>/kim-command-skill
cd kim-command-skill
```

然后接入以下目录：

- `skills/arming-command/SKILL.md`：会话级入口 skill
- `skills/*/SKILL.md`：各具体方法 skill
- `commands/`：手动命令入口
- `agents/`：子代理提示词
- `hooks/`：会话注入脚本

### 方式二：直接贴给 AI agent 使用

把 `skills/arming-command/SKILL.md` 作为 system prompt 的一部分注入；
需要时再按任务场景加载对应 `skills/*/SKILL.md`。

---

## 🚀 使用方式

会话开始时先加载 `skills/arming-command/SKILL.md`，它会：

1. 先以“任务绝对化”约束判断
2. 再判断当前最值得调用的 skill
3. 尽量少而准地加载方法，而不是机械全调用
4. 在高压、低资源、反馈嘈杂时优先切换到强执行模式

### 手动命令入口

- `/single-core-command` —— 👑 单核指挥
- `/self-reliance-stack` —— 🧱 自力更生
- `/crisis-mode-design` —— 🌪️ 常态危机
- `/instruction-decomposition` —— 📜 指令级拆解
- `/high-frequency-review` —— 🧪 高频检阅
- `/closed-loop-feedback` —— 🔒 反馈封闭
- `/resource-lockdown` —— 🎯 资源锁仓
- `/minimum-survival-stack` —— 🛖 最小生存栈
- `/symbolic-breakthrough` —— 🚩 象征成果先行
- `/workflows` —— 🔗 工作流组合

---

## 🔄 典型工作流

### 工作流 A：高压交付
`单核指挥 → 资源锁仓 → 指令级拆解 → 高频检阅`

适用：今天必须交、不能失败、范围已经确定的任务。

### 工作流 B：从零起步
`自力更生 → 最小生存栈 → 象征成果先行 → 高频检阅`

适用：没有完整条件、需要先做出可运行版本的任务。

### 工作流 C：需求混乱治理
`单核指挥 → 反馈封闭 → 指令级拆解 → 象征成果先行`

适用：反馈太多、版本太乱、难以统一方向的任务。

---

## 📚 支撑文件

### 🤖 Subagent Prompts

- `agents/war-room-director.md` —— 主任务指挥官
- `agents/self-reliance-builder.md` —— 本地替代方案构建 agent
- `agents/inspection-officer.md` —— 高频检阅 agent

### 🗺️ Reference Guides

- `docs/priority-ladder.md` —— 优先级阶梯模板
- `docs/dependency-failure-playbook.md` —— 依赖失效应对手册
- `docs/minimum-survival-checklist.md` —— 最小生存栈检查单
- `docs/visible-win-patterns.md` —— 可展示成果模式库
- `docs/platforms.md` —— 平台安装与验证说明

---

## ❌ 这不是什么

- 这不是朝鲜政治宣传
- 这不是对任何现实政治人物的颂扬
- 这不是给现实组织做人身压迫式管理指南
- 这不是全能方法；探索性、创意性任务仍需搭配其他 skill

---

## 🗂️ 项目结构

```text
kim-command-skill/
├── .claude-plugin/plugin.json
├── .codex/INSTALL.md
├── .cursor-plugin/plugin.json
├── .opencode/INSTALL.md
├── agents/
│   ├── war-room-director.md
│   ├── self-reliance-builder.md
│   └── inspection-officer.md
├── assets/
│   └── skill-map.md
├── commands/
│   ├── single-core-command.md
│   ├── self-reliance-stack.md
│   ├── crisis-mode-design.md
│   ├── instruction-decomposition.md
│   ├── high-frequency-review.md
│   ├── closed-loop-feedback.md
│   ├── resource-lockdown.md
│   ├── minimum-survival-stack.md
│   ├── symbolic-breakthrough.md
│   └── workflows.md
├── docs/
│   ├── platforms.md
│   ├── README.codex.md
│   ├── README.opencode.md
│   ├── priority-ladder.md
│   ├── dependency-failure-playbook.md
│   ├── minimum-survival-checklist.md
│   └── visible-win-patterns.md
├── hooks/
│   ├── hooks.json
│   ├── session-start
│   ├── session-start.ps1
│   └── run-hook.cmd
├── skills/
│   ├── arming-command/
│   │   └── SKILL.md
│   ├── command-core/
│   │   └── SKILL.md
│   ├── single-core-command/
│   │   └── SKILL.md
│   ├── self-reliance-stack/
│   │   └── SKILL.md
│   ├── crisis-mode-design/
│   │   └── SKILL.md
│   ├── instruction-decomposition/
│   │   └── SKILL.md
│   ├── high-frequency-review/
│   │   └── SKILL.md
│   ├── closed-loop-feedback/
│   │   └── SKILL.md
│   ├── resource-lockdown/
│   │   └── SKILL.md
│   ├── minimum-survival-stack/
│   │   └── SKILL.md
│   ├── symbolic-breakthrough/
│   │   └── SKILL.md
│   └── workflows/
│       └── SKILL.md
├── tests/
│   ├── validate.sh
│   └── validate.ps1
├── .gitignore
├── LICENSE
├── package.json
└── README.md
```

---

## 📝 一句话总结

这套 skill 的核心不是“崇拜谁”，而是把一种**极端集中型组织的执行逻辑**
翻译成 AI 可用的工作纪律：

> **锁定唯一主任务，优先内生能力，压缩成命令链，用高频检阅和可见战果持续推进。**
