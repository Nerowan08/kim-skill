# 平台支持与安装说明

## Claude Code
- 入口 skill：`skills/arming-command/SKILL.md`
- 命令目录：`commands/`
- hook 配置：`hooks/hooks.json`

## Cursor
- 导入 `.cursor-plugin/plugin.json`
- 注册 `commands/`
- 需要自动注入时读取 `hooks/`

## Codex
- 参考 `docs/README.codex.md`

## OpenCode
- 参考 `docs/README.opencode.md`

## 通用安装检查
- `README.md` 可读
- `skills/*/SKILL.md` 存在
- `commands/` 文件存在
- `hooks/` 脚本可运行
- `tests/validate.sh` 或 `tests/validate.ps1` 可通过
