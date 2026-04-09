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

## 任务复杂度预评估

在分类协议的 3 个问题之后、最终路由之前，增加复杂度评估，决定**加载深度**：

### 复杂度评估矩阵

| 维度 | 简单（1 分） | 中等（2 分） | 复杂（3 分） |
|------|------------|------------|------------|
| 涉及因素 | 1–2 个，关系清晰 | 3–5 个，有交互 | 5+ 个，互相牵制 |
| 信息完整度 | 充分，可直接执行 | 部分缺失，需补充 | 大量未知，需系统调查 |
| 决策风险 | 低，做错可轻松回退 | 中，有影响但可控 | 高，代价大或不可逆 |
| 预期步骤数 | 1–3 步可完成 | 需要 1 个 skill 辅助 | 需要多个 skill 协作 |

**评分规则：** 4 项加总。

| 总分 | 复杂度等级 | 推荐加载深度 |
|------|----------|------------|
| 4–6 分 | 简单 | 不加载或仅吸收"实事求是"原则 |
| 7–9 分 | 中等 | 加载 1 个最匹配的 skill |
| 10–12 分 | 复杂 | 走完整 workflow |

**附加规则：** 无论总分多少，只要"决策风险"为高（3 分），就必须走完整流程 + criticism-self-criticism 复盘。

## Skill 选择区分器

以下 skill 对容易混淆，用这个速查表做选择：

### investigation-first vs mass-line

| 你的情况 | 选择 |
|---------|------|
| 第一次接触这个问题，完全不了解现状 | **investigation-first**（先摸底） |
| 已经有了一些信息，需要从多个来源交叉验证 | **mass-line**（多源汇聚） |
| 两者都需要 | 先 investigation-first 摸底，再 mass-line 验证 |

### contradiction-analysis vs overall-planning

| 你的情况 | 选择 |
|---------|------|
| 需要找"哪个问题最关键"，集中解决 | **contradiction-analysis**（找主要矛盾） |
| 多个目标都重要，需要动态平衡不能只抓一个 | **overall-planning**（统筹兼顾） |
| 先找主要矛盾，发现多个都重要 | 先 contradiction-analysis，结论触发 overall-planning |

### concentrate-forces vs protracted-strategy

| 你的情况 | 选择 |
|---------|------|
| 有多个任务，需要决定"先做哪个" | **concentrate-forces**（聚焦打法） |
| 任务需要很长时间，短期内做不完 | **protracted-strategy**（长跑策略） |
| 长期任务中每一阶段要聚焦 | protracted-strategy 定阶段，concentrate-forces 做执行 |

### spark-prairie-fire vs protracted-strategy

| 你的情况 | 选择 |
|---------|------|
| 从零开始，资源极少，需要找切入点 | **spark-prairie-fire**（建立根据地） |
| 已经起步，需要分阶段推进到最终目标 | **protracted-strategy**（持久战略） |
| 从零开始做到最终目标 | 先 spark-prairie-fire 找根据地，再 protracted-strategy 定阶段 |

### practice-cognition vs criticism-self-criticism

| 你的情况 | 选择 |
|---------|------|
| 有方案/假说，需要验证对不对 | **practice-cognition**（实践验证） |
| 工作已经做完，需要审视质量 | **criticism-self-criticism**（质量复盘） |
| 验证完发现有新问题 | practice-cognition → 重新实践 |

## 何时走 Workflow 而非单 Skill

当任务同时触发了分类协议中 3 个或更多 skill 时，应走 workflow 而非单独调用：

| 场景 | 用 workflow |
|------|------------|
| 从零启动新项目/新领域 | workflows → 新项目启动 |
| 已知问题但根因不明、反复失败 | workflows → 复杂问题攻坚 |
| 已有方案但效果不理想，需要迭代 | workflows → 方案迭代优化 |
| 线上紧急故障，需要快速止血 | workflows → 紧急故障响应 |
| 多个方案需要对比选型 | workflows → 技术选型 |

## Token 预算指引

加载 shijian skill 会增加 token 开销。以下估算基于典型场景，帮助判断"值不值得加载"：

| 调用方式 | 预估额外 token 开销 | 适用场景 |
|---------|-------------------|---------|
| 不加载任何 skill | 0 | 简单、明确、一次性任务 |
| 单个 skill（如 investigation-first） | 2k–4k | 只需要一个方法论工具 |
| 单个 skill 轻量执行 | 1k–2k | 跳过详细模板，只走核心步骤 |
| Workflow 2（复杂问题攻坚，5 步） | 8k–15k | 需要完整的调查→分析→执行→验证→复盘 |
| Workflow 4（紧急故障响应，4 步精简版） | 3k–6k | 速度优先，每个步骤限时 |
| Workflow 5（技术选型，5 步） | 6k–12k | 结构化对比 + 原型验证 |
| 全部 11 个 skill 串行 | 20k–40k | ❌ 几乎不需要，这是过度调用 |

**判断原则：**

1. **简单任务（<1k token 即可完成）**：不要加载任何 skill。arming-thought 的判断本身就是成本。
2. **中等复杂度**：加载 1 个最匹配的 skill 即可。走操作规程的核心步骤，不必填完所有模板。
3. **高复杂度 / 高风险**：走完整 workflow。此时 token 开销是值得的——方法论带来的质量提升远超成本。
4. **紧急场景**：走 Workflow 4（紧急故障响应），每个步骤有时间限制，模板精简到最少。

**何时跳过方法论更划算：**

- 用户只问一个事实性问题（"这个 API 的参数是什么"）→ 直接回答
- 任务是纯执行性的（"把这段代码格式化"）→ 直接执行
- 上下文中已有足够信息，判断已经清晰 → 不需要调查和分析
- 你的 token 预算已经很紧张（长会话尾部）→ 简化执行，只保留核心步骤

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
