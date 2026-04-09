---
name: workflows
description: 跨 skill 编排层，定义多种高集中执行方法的调用顺序与数据传递规范。
allowed-tools: all
---


# Workflows

## 作用
当一个 skill 不足以解决问题时，使用本文件串联多个 skill。

## 推荐组合

### 工作流 A：高压交付
`single-core-command -> resource-lockdown -> instruction-decomposition -> high-frequency-review`

### 工作流 B：从零起步
`self-reliance-stack -> minimum-survival-stack -> symbolic-breakthrough -> high-frequency-review`

### 工作流 C：需求混乱治理
`single-core-command -> closed-loop-feedback -> instruction-decomposition -> symbolic-breakthrough`

## 数据传递规范
上一 skill 输出中的以下字段，应作为下一 skill 的输入：
- 主任务
- 当前阻塞
- 立即动作
- 阶段战果
- 检阅点

