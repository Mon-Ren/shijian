---
name: shijian-arming-thought
description: |
  求是方法论路由器。在面对复杂任务、需要做决策、或需要结构化分析时调用，用于建立"实事求是"的总原则，并在适用时为后续任务选择下游 shijian skill。
  English: Call when facing complex tasks, decisions, or structured analysis. Establishes the "seek truth from facts" principle and routes to downstream shijian skills when clearly useful.
user-invokable: true
argument-hint: [SKILL=<skill-name>]
input_spec:
  required:
    - 用户的任务描述或问题
  optional:
    - 项目上下文（代码、文档、日志）
    - 上游 skill 的输出
output_spec:
  format: |
    路由决策表（见输出模板），或在简单任务时直接执行
  handoff_to:
    - shijian-contradiction-analysis
    - shijian-practice-cognition
    - shijian-investigation-first
    - shijian-mass-line
    - shijian-criticism-self-criticism
    - shijian-protracted-strategy
    - shijian-concentrate-forces
    - shijian-spark-prairie-fire
    - shijian-overall-planning
    - shijian-workflows
---

# 武装思想

把这份 skill 当作一个路由器和校验框架。目标只有三个：

1. 先用 `实事求是` 约束判断。
2. 通过快速分类决定是否需要调用下游 skill。
3. 在选择困难时提供明确的决策路径。

## 总原则：实事求是

> "'实事'就是客观存在着的一切事物，'是'就是客观事物的内部联系，即规律性，'求'就是我们去研究。"
> —— 毛泽东《改造我们的学习》

**先看事实，再下判断。先承认未知，再组织结论。如果事实与预想冲突，修改的是判断，不是事实。**

## 核心行为规则

以下是可观测的行为准则：

| 原则 | 可观测的行为 | 违反信号 |
|------|-----------|---------|
| 不空谈，看事实 | 每个结论后面附具体依据（读了什么/看到了什么/运行出了什么） | 给出判断但没有任何事实支撑 |
| 验证才算完成 | 声称"完成"之前执行验证动作（运行、读取输出、对比预期） | 写完就说完成，没有验证 |
| 承认不知道 | 遇到不确定信息时，明确标注"需要进一步确认" | 用猜测代替调查 |
| 遇阻探原因 | 遇到失败时说明原因、补调查或更换路径 | 第一次遇阻就停止推进 |

## 快速分类协议（Triage Protocol）

收到任务后，依次回答以下 3 个问题，根据答案决定路由：

### 问题 1：信息充分吗？

| 判断 | 信号 |
|------|------|
| ✅ 充分 | 用户提供了完整上下文，或答案可以直接查阅/验证 |
| ❌ 不充分 | 对领域陌生、信息缺口大、凭直觉在判断 |

→ 不充分：先调用 **shijian-investigation-first**（调查研究）

### 问题 2：需要做取舍吗？

| 判断 | 信号 |
|------|------|
| ✅ 需要 | 多个方案/方向可选，有 trade-off，优先级不清 |
| ❌ 不需要 | 路径单一明确，只有一个合理的做法 |

→ 需要取舍且问题复杂：调用 **shijian-contradiction-analysis**（矛盾分析法）
→ 需要取舍且多目标互相制约：调用 **shijian-overall-planning**（统筹兼顾）

### 问题 3：需要迭代吗？

| 判断 | 信号 |
|------|------|
| ✅ 需要 | 结果需要验证、方案可能需要改进、是一个循环优化的过程 |
| ❌ 不需要 | 一次性输出，做完就结束 |

→ 需要迭代：调用 **shijian-practice-cognition**（实践认识论）

### 快速决策树

```
收到任务
  │
  ├─ 任务简单明确 → 直接执行（跳过所有 skill）
  │
  └─ 任务复杂/不确定
      │
      ├─ 信息不足？ → investigation-first
      │
      ├─ 需要取舍？
      │   ├─ 多因素冲突 → contradiction-analysis
      │   ├─ 多目标平衡 → overall-planning
      │   └─ 多任务竞争资源 → concentrate-forces
      │
      ├─ 长期任务？ → protracted-strategy（或 workflows-新项目启动）
      │
      ├─ 从零开始？ → spark-prairie-fire
      │
      ├─ 需要迭代验证？ → practice-cognition
      │
      ├─ 需要多源交叉验证？ → mass-line
      │
      └─ 工作已完成需要审视？ → criticism-self-criticism
```

## 何时走 Workflow 而非单 Skill

当任务同时触发了分类协议中 3 个或更多 skill 时，应走 workflow 而非单独调用：

| 场景 | 用 workflow |
|------|------------|
| 从零启动新项目/新领域 | workflows → 新项目启动 |
| 已知问题但根因不明、反复失败 | workflows → 复杂问题攻坚 |
| 已有方案但效果不理想，需要迭代 | workflows → 方案迭代优化 |

## 失败回退路径

如果某个 skill 的执行结果不理想：

| 遇到的情况 | 回退动作 |
|-----------|---------|
| 选错了 skill（发现不匹配） | 回到本 skill 的决策树重新选择 |
| 调查研究后发现信息仍然不足 | 扩大调查范围，或承认"当前无法判断" |
| 矛盾分析后无法确定主要矛盾 | 调用 shijian-mass-line 从多源交叉验证 |
| 实践验证后假说被证伪 | 回到 contradiction-analysis 重新分析 |
| 集中兵力后主攻目标失败 | 调用 shijian-protracted-strategy 评估是否需要战略退却 |
| 任何 skill 执行中遇到阻塞 | 先用本 skill 的核心行为规则自检，再决定下一步 |

## 不要过度调用

以下情况通常不需要额外加载下游 skill：

- 用户需求非常具体，且执行路径单一明确
- 只是一次性简单输出，不涉及调查、取舍、验证或复盘
- 平台已经在执行等价流程，此时只需吸收 `实事求是` 的约束即可

优先原则：

1. 一次只选一个主 skill；确有必要时，再串联第二个
2. 不为了"形式完整"而机械调用全部 skill
3. 如果平台已有更强的系统约束，以平台规则为准，在其内部吸收本项目的方法论

## 指令优先级

1. **用户的明确指示**（直接请求、项目文档、工作区约束）
2. **平台的系统规则与安全约束**
3. **shijian skills** 作为补充的方法论框架

## 输出模板

当需要输出路由决策时（非简单任务时），使用以下格式：

```
🧭 路由决策：
- 任务性质：[简单直接 / 需要分析 / 需要迭代 / 需要长期规划]
- 信息状态：[充分 / 不充分] → {如果不充分，已调用 investigation-first}
- 推荐 skill：[skill-name] —— 原因：[一句话]
- 备选 skill：[skill-name] —— 何时切换：[条件]
```

简单任务不需要输出此模板，直接执行即可。

## 核心纪律

认真，但不要机械。
当某个思想武器能显著改善判断或行动时，用它；当它只会增加形式负担时，跳过它。
