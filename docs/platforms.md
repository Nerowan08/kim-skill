# 平台支持与安装说明

## 先分清两种使用模式

| 模式 | 默认是否要求 | 需要的内容 | 适用场景 |
|---|---|---|---|
| 最小安装集 | 是 | `skills/`、`commands/`、`agents/`、`hooks/`、`tests/` | 任何支持 system prompt、Markdown commands 或手动加载文档的 AI 工具 |
| 完整发布集 | 否 | 最小安装集 + `.claude-plugin/`、`.cursor-plugin/`、`.codex/`、`.opencode/`、`.github/workflows/`、`site/` | 需要插件元数据、平台说明或 GitHub Pages 公开站点 |

默认推荐从**最小安装集**开始。只有当你明确需要平台级 manifest 或公开站点时，再启用完整发布集。

## Claude Code

### 最小安装集
- 入口 skill：`skills/arming-command/SKILL.md`
- 总控 skill：`skills/command-core/SKILL.md`
- 手动命令：`commands/`
- 自动注入：`hooks/hooks.json`

### 可选插件元数据
- 插件文件：`.claude-plugin/plugin.json`
- 仅当你的 Claude Code 工作流需要显式 plugin manifest 时才使用

## Cursor

### 最小安装集
- 入口 skill：`skills/arming-command/SKILL.md`
- 命令目录：`commands/`
- hook 目录：`hooks/`

### 可选插件元数据
- 插件文件：`.cursor-plugin/plugin.json`
- 仅当你的 Cursor 环境要求显式 plugin manifest 时才使用

## Codex

- 安装入口文档：`.codex/INSTALL.md`
- 运行方式说明：`docs/README.codex.md`
- 即使不使用 `.codex/INSTALL.md`，也可以直接按最小安装集加载 `skills/` 与 `commands/`

## OpenCode

- 安装入口文档：`.opencode/INSTALL.md`
- 运行方式说明：`docs/README.opencode.md`
- 即使不使用 `.opencode/INSTALL.md`，也可以直接按最小安装集加载 `skills/` 与 `commands/`

## GitHub Pages

- 站点源码：`site/`
- 部署工作流：`.github/workflows/pages.yml`
- 发布说明：`docs/github-pages.md`

适合承载：

- 项目介绍
- 技能目录
- 场景示例
- 面向搜索引擎的公开说明页

## 自检怎么跑

### 默认自检（检查最小安装集）

macOS / Linux：

```bash
bash tests/validate.sh
```

Windows：

```powershell
powershell -NoLogo -NoProfile -ExecutionPolicy Bypass -File tests/validate.ps1
```

默认自检会：

- 检查核心文件是否存在
- 校验当前已有 JSON 是否合法
- 检查所有 `skills/*/SKILL.md`、`commands/*.md`、`agents/*.md` 的 frontmatter
- 检查命令文件和场景 skill 是否一一对应
- 验证 hook 脚本是否可读

### 严格自检（检查完整发布集）

macOS / Linux：

```bash
bash tests/validate.sh --strict
```

Windows：

```powershell
powershell -NoLogo -NoProfile -ExecutionPolicy Bypass -File tests/validate.ps1 -Strict
```

严格自检会额外检查：

- `.claude-plugin/plugin.json`
- `.cursor-plugin/plugin.json`
- `.codex/INSTALL.md`
- `.opencode/INSTALL.md`
- `docs/github-pages.md`
- `.github/workflows/pages.yml`
- `site/` 里的关键页面和样式文件

如果当前目录是 Git 仓库，严格模式还会继续检查这些发布文件**是否已经被 Git 追踪**，从而避免“本地存在，但推到 GitHub 后路径 404”的问题。
