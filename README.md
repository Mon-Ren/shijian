# shijian

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![OpenClaw Skills](https://img.shields.io/badge/OpenClaw-skills-green.svg)](https://github.com/openclaw/openclaw)
[![Skills](https://img.shields.io/badge/skills-11-red.svg)](#11-个-skill)
[![Platform](https://img.shields.io/badge/platform-macOS%20%7C%20Linux%20%7C%20Windows-lightgrey.svg)](#安装)

> 实践 × 时间 —— 从实践中来，到实践中去。

AI Agent 方法论工具集，适配 [OpenClaw](https://github.com/openclaw/openclaw)。

不是 prompt 工程，不是角色扮演。是一套让 AI **先看事实再下判断、先搞清楚再动手、做完之后会复盘** 的结构化方法论。

📖 **[查看文档站点 →](https://mon-ren.github.io/shijian/)**

## 为什么需要这个

当前的 AI Agent 有几个通病：

- 面对复杂问题，胡子眉毛一把抓，抓不住重点
- 没有调查就急于给出答案
- 方案做完不自查，"差不多就行了"
- 遇到困难就说"超出了能力范围"
- 同时做十件事，件件做不好

shijian 要解决的就是这些——**怎么想问题、怎么做事情**。

## 安装

### macOS / Linux（一键）

```bash
curl -fsSL https://raw.githubusercontent.com/Mon-Ren/shijian/main/install.sh | sh
```

### Windows（一键，PowerShell）

```powershell
iex (iwr -useb https://raw.githubusercontent.com/Mon-Ren/shijian/main/install.ps1).Content
```

### 手动安装

```bash
git clone https://github.com/Mon-Ren/shijian.git /tmp/shijian
cp -r /tmp/shijian/skills/shijian-* ~/.openclaw/skills/
```

### 可选：启用常驻行为约束

将 `SOUL-patch.md` 中的"求是"段落合并到你的 `~/.openclaw/workspace/SOUL.md`，让 AI 在每次对话中自动遵守"先看事实再下判断"的行为准则。

安装后重启 OpenClaw 即可生效。

## 包含内容

### 11 个 Skill

| Skill | 一句话 | 什么时候用 |
|-------|--------|-----------|
| **shijian-arming-thought** | 总路由器 | 复杂任务、需要决策、需要结构化分析 |
| **shijian-contradiction-analysis** | 找主要矛盾 | 问题复杂、优先级不清、多个因素互相牵制 |
| **shijian-practice-cognition** | 迭代验证 | 需要验证方案、试错迭代、复盘升级 |
| **shijian-investigation-first** | 先调查再说 | 信息不足、领域陌生、需要摸清现状 |
| **shijian-mass-line** | 多源汇聚 | 需要交叉验证、整合多方反馈 |
| **shijian-criticism-self-criticism** | 质量审查 | 工作完成后的审视、复盘、纠偏 |
| **shijian-protracted-strategy** | 长跑策略 | 长期任务、需要分阶段推进 |
| **shijian-concentrate-forces** | 聚焦打法 | 多个任务争资源、需要确定主攻方向 |
| **shijian-spark-prairie-fire** | 从零开始 | 资源极少、需要找最小可行切入点 |
| **shijian-overall-planning** | 多目标平衡 | 多个目标相互制约、需要权衡取舍 |
| **shijian-workflows** | 串联编排 | 需要多个 skill 协作的标准流程 |

### 支撑文件

每个 skill 目录下可能还有：

- `original-texts.md` —— 原著原文引用，想看出处时查阅
- `*-prompt.md` —— sub-agent prompt，可通过 `sessions_spawn` 派遣执行专项分析
- `*-reference.md` —— 速查表和检查清单

## 使用示例

### 场景一：调试一个长期报错的服务

你告诉 AI："这个 API 服务报 500 错误好几天了，帮我看看。"

**不装 shijian 时：** AI 直接看代码，猜一个可能的原因，改几行，说"试试看"。

**装了 shijian 之后：**

```
🧭 [arming-thought] 检测到长期故障 + 根因不明 → 加载 investigation-first
🔎 [investigation-first] 先收集事实：查看日志、监控、最近部署记录、错误堆栈
⚔️ [contradiction-analysis] 分析矛盾：是代码问题 vs 基础设施问题？短期变化 vs 长期隐患？
🔄 [practice-cognition] 制定验证假设 → 执行修复 → 确认效果
🪞 [criticism-self-criticism] 复盘：为什么之前没发现？需要补什么监控？
```

### 场景二：从零搭一个新项目

你说："我想做一个 XX 工具，但不知道从哪下手。"

```
🧭 [arming-thought] 新项目 + 资源有限 → 加载 spark-prairie-fire + investigation-first
🔎 [investigation-first] 调研现有方案、用户需求、技术可行性
🔥 [spark-prairie-fire] 找最小切入点，定义 MVP，建立"根据地"
🔄 [practice-cognition] 先做一个能跑的版本 → 收集反馈 → 迭代升级
```

### 场景三：同时有五个需求不知道先做哪个

你说："老板给了五个需求，工期只有两周。"

```
🧭 [arming-thought] 多任务争资源 → 加载 concentrate-forces + contradiction-analysis
⚔️ [contradiction-analysis] 找主要矛盾：哪个需求是瓶颈？哪个能带动其他？
🎯 [concentrate-forces] 砍到一个主攻方向，其余排队
⏳ [protracted-strategy] 剩余需求分阶段推进，不急于一次全做
```

### 什么时候不需要加载 skill？

简单、明确的任务不需要任何方法论。shijian 不是万金油——`arming-thought` 会判断任务复杂度，简单任务直接干，不浪费 token。

## 工作原理

```
精神底色：精益求精 · 坚持到底
    │
    ▼
总原则：实事求是 ←── SOUL.md 常驻约束
    │
    ▼
第一层·哲学基座 ── 分析问题的底层框架
  ├── 矛盾分析法（找主要矛盾）
  └── 实践认识论（迭代验证）
    │
    ▼
第二层·工作方法 ── 日常工作的基本方法
  ├── 调查研究（先搞清楚再说）
  ├── 多源汇聚（交叉验证）
  └── 质量审查（做完会复盘）
    │
    ▼
第三层·战略战术 ── 具体任务的行动指导
  ├── 持久战略（长跑不急）
  ├── 集中兵力（聚焦不散）
  ├── 星火燎原（从小做起）
  └── 统筹兼顾（多目标平衡）
    │
    ▼
编排层：工作流组合 ── 多个 skill 的标准串联
```

不是每个问题都要用全部武器。arming-thought 作为路由器，根据场景决定要不要调用、调用哪个。简单任务直接干，不用加载任何 skill。

## FAQ

**Q: 这跟直接写 prompt 有什么区别？**

shijian 是**结构化方法论**，不是一段固定 prompt。每个 skill 有明确的触发条件、操作流程和输出格式。arming-thought 做路由器，按需调度——而不是把所有规则一股脑塞进 system prompt。

**Q: 我不在 OpenClaw 上，能用吗？**

skill 的核心内容是 Markdown 方法论文档，理论上任何支持 system prompt / skill 的 AI 框架都可以参考。安装脚本和 sub-agent prompt 专为 OpenClaw 设计。

**Q: 装了之后 AI 会不会变慢？**

不会。skill 只在需要时加载——简单任务不触发任何 skill，token 开销为零。复杂任务才按需调用，反而因为有章法而更快收敛。

**Q: SOUL-patch.md 是必须的吗？**

可选。合并后 AI 会在每次对话中常驻"求是"行为约束（先看事实再下判断）。如果你觉得不需要常驻约束，只用 skill 就够了。

**Q: 怎么更新到最新版？**

重新运行安装脚本即可，脚本会覆盖已有的 skill 目录。

**Q: 我可以修改或扩展这些 skill 吗？**

当然。MIT 协议，随便改。skill 全是 Markdown，编辑器打开就能改。如果你做了有价值的扩展，欢迎 PR。

## 兼容性

- macOS / Linux / Windows
- 纯 Markdown，无平台依赖
- sub-agent prompt 兼容 OpenClaw `sessions_spawn`

## License

[MIT](LICENSE)
