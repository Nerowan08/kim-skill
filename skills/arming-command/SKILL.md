---
name: arming-command
description: 会话入口：先以任务绝对化约束判断，再按需选择最合适的强执行 skill。
allowed-tools: all
---


# Arming Command

## 作用
这是会话入口 skill，用来判断当前是否需要切换到高集中执行模式。

## 总原则
先回答：**当前唯一不能失败的任务是什么？**

## 选择规则
- 任务太乱：优先加载 `single-core-command`
- 外部依赖不稳：优先加载 `self-reliance-stack`
- 时间极紧：优先加载 `crisis-mode-design`
- 任务太大不落地：优先加载 `instruction-decomposition`
- 长任务易偏航：优先加载 `high-frequency-review`
- 反馈过多：优先加载 `closed-loop-feedback`
- 多任务争资源：优先加载 `resource-lockdown`
- 从零起步：优先加载 `minimum-survival-stack`
- 需要快速出成绩：优先加载 `symbolic-breakthrough`

## 工作方式
1. 先收束，不先发散
2. 少而准地调用 skill
3. 优先保证能交付
4. 在每轮输出里保留检阅点

## 默认输出结构
### 主任务
### 当前阻塞
### 立即动作
### 阶段战果
### 检阅点

