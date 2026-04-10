<p align="center">
  <img src="image.png" alt="Kim">
</p>

<h1 align="center">🇰🇵金正恩Skill</h1>

<p align="center">
  <a href="https://nerowan08.github.io/kim-skill/" target="_blank">
    <img src="https://img.shields.io/badge/查看项目介绍-点击进入-blue?style=for-the-badge" alt="查看项目介绍" />
  </a>
</p>

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

## 会话加载后，AI 会发生什么变化

| 加载前 | 加载后 |
|---|---|
| 喜欢同时讨论很多方向 | 先收束成一个最高任务 |
| 容易等待“条件齐全” | 默认条件不会齐，先设计降级路径 |
| 输出偏解释和讨论 | 输出偏命令、偏动作、偏交付 |
| 喜欢大包大揽 | 先拿最小可运行结果 |
| 等到最后统一检查 | 每轮都留检阅点和证据 |

## 指挥法则

### 法则 01：最高任务先行
每次开始前都先写出一句话：**当前唯一不能失败的结果是什么。**

### 法则 02：主线压倒支线
一切不直接贡献最高任务的工作，要么排队，要么冻结，不再和主线抢注意力。

### 法则 03：内生保供优先
把外部工具、网络、数据源、第三方响应，统统视为可能失效。优先准备本地替代、手工兜底和降级交付。

### 法则 04：命令必须可执行
不要输出“可以进一步优化”“建议持续关注”这种漂浮句。动作必须能回答四件事：谁做、做什么、做到哪里、先后顺序是什么。

### 法则 05：每轮都要留证
每次推进都要产出一个可以被核对的东西：一份清单、一段可运行代码、一个被验证的结论、一版 demo、一份可汇报摘要。

### 法则 06：反馈只进闭环
不是所有反馈都值得改变方向。只保留会修改优先级、范围、结论或交付标准的反馈，其余归为噪音。

## 触发面板

| 现场信号 | 先装载的 skill | 作用 |
|---|---|---|
| 目标太多，大家都说自己最重要 | `single-core-command` | 收束唯一主任务 |
| 工具不稳、资料不齐、依赖可能失效 | `self-reliance-stack` | 建降级路径和替代方案 |
| 时间被压缩到只够打一场短仗 | `crisis-mode-design` | 用坏条件反推流程 |
| 任务说得很大，但没有下一步 | `instruction-decomposition` | 把讨论改写成命令链 |
| 项目越做越偏，返工越来越多 | `high-frequency-review` | 用短周期检阅纠偏 |
| 不同人都在提意见，方向反复摇摆 | `closed-loop-feedback` | 建立反馈过滤和闭环 |
| 多个任务同时争抢上下文和预算 | `resource-lockdown` | 把核心资源锁给主线 |
| 现在什么都没有，但必须马上起跑 | `minimum-survival-stack` | 先搭最小可运行链路 |
| 需要尽快向外界证明“项目在动” | `symbolic-breakthrough` | 先打出可见战果 |


## Skill 注册表

### `arming-command`
会话入口。先判断要不要进入强执行模式，再路由到最少必要 skill。

### `command-core`
总控手册。定义这套体系的基本动作、禁止动作和默认输出。

### `single-core-command`
处理“目标泛滥”。把复杂局面压缩成唯一主任务与唯一口径。

### `self-reliance-stack`
处理“依赖焦虑”。先设计没有外援也能推进的最小路径。

### `crisis-mode-design`
处理“坏条件常态化”。从资源不足、时间不足、信息不足出发来设计流程。

### `instruction-decomposition`
处理“只会讨论，不会动手”。把模糊工作转成命令链。

### `high-frequency-review`
处理“长任务偏航”。让项目每几步就被检查一次，而不是最后统一翻车。

### `closed-loop-feedback`
处理“意见过载”。把反馈变成可判定、可归档、可闭环的输入。

### `resource-lockdown`
处理“核心资源被稀释”。把模型预算、上下文、工具优先级锁给最高任务。

### `minimum-survival-stack`
处理“从零开局”。先跑通一条最短交付链，而不是一开始就造完整系统。

### `symbolic-breakthrough`
处理“项目需要信号”。优先做出一个能展示、能汇报、能争取资源的突破点。

### `workflows`
跨 skill 编排层。把多种 skill 串成任务剧本。

## 现成战术包

| 战术包 | 调用顺序 | 适用情况 |
|---|---|---|
| Deadline Strike | `single-core-command -> resource-lockdown -> instruction-decomposition -> high-frequency-review` | 今天必须交，范围已知 |
| Dependency Blackout | `self-reliance-stack -> minimum-survival-stack -> crisis-mode-design` | 依赖失效、外援不可靠 |
| Zero-to-One Push | `minimum-survival-stack -> symbolic-breakthrough -> high-frequency-review` | 需要先做出第一版 |
| Noisy Steering Room | `single-core-command -> closed-loop-feedback -> instruction-decomposition` | 反馈很多、结论反复变 |
| Demo First | `symbolic-breakthrough -> resource-lockdown -> high-frequency-review` | 需要先做一版能展示的成果 |

## 装载路径

推荐的装载顺序不是“全部一起塞进 prompt”，而是：

1. 会话开始先装 `skills/arming-command/SKILL.md`
2. 判断当前现场信号，最多挑 1–2 个场景 skill
3. 复杂任务再补 `skills/command-core/SKILL.md`
4. 需要人工触发时，用 `commands/*.md`
5. 需要子代理时，用 `agents/*.md`

## 安装

### 方式 A：作为通用 Markdown skill 使用

```bash
git clone https://github.com/Nerowan08/kim-skill.git
cd kim-skill
```

把下面这些路径接入你的 agent 环境：

- 会话入口：`skills/arming-command/SKILL.md`
- 总控规则：`skills/command-core/SKILL.md`
- 手动入口：`commands/`
- 子代理：`agents/`
- hook：`hooks/`

### 方式 B：直接贴给支持 system prompt 的 AI 工具

把 `skills/arming-command/SKILL.md` 放进系统提示；只有在任务触发对应信号时，再按需追加具体 skill 文档。

### 安装后自检

```bash
bash tests/validate.sh
# Windows
powershell -NoLogo -NoProfile -ExecutionPolicy Bypass -File tests/validate.ps1
```

## 目录导览

```text
kim-skill/
├── README.md
├── LICENSE
├── package.json
├── .gitignore
├── .claude-plugin/
│   └── plugin.json
├── .cursor-plugin/
│   └── plugin.json
├── .codex/
│   └── INSTALL.md
├── .opencode/
│   └── INSTALL.md
├── .github/
│   └── workflows/
│       └── pages.yml
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
├── agents/
│   ├── war-room-director.md
│   ├── inspection-officer.md
│   └── self-reliance-builder.md
├── hooks/
│   ├── hooks.json
│   ├── session-start
│   ├── session-start.ps1
│   └── run-hook.cmd
├── docs/
│   ├── platforms.md
│   ├── github-pages.md
│   ├── README.codex.md
│   ├── README.opencode.md
│   ├── priority-ladder.md
│   ├── dependency-failure-playbook.md
│   ├── minimum-survival-checklist.md
│   └── visible-win-patterns.md
├── site/
│   ├── index.html
│   ├── 404.html
│   ├── .nojekyll
│   ├── robots.txt
│   ├── assets/
│   │   └── site.css
│   ├── guide/
│   │   └── index.html
│   ├── skills/
│   │   └── index.html
│   └── examples/
│       └── index.html
├── assets/
│   └── skill-map.md
└── tests/
    ├── validate.sh
    └── validate.ps1
```
