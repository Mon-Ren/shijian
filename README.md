# shijian

> 实践 × 时间 —— 从实践中来，到实践中去。

AI Agent 方法论工具集，适配 [OpenClaw](https://github.com/openclaw/openclaw)。

不是 prompt 工程，不是角色扮演。是一套让 AI **先看事实再下判断、先搞清楚再动手、做完之后会复盘** 的结构化方法论。

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

## 兼容性

- macOS / Linux / Windows
- 纯 Markdown，无平台依赖
- sub-agent prompt 兼容 OpenClaw `sessions_spawn`

## License

[MIT](LICENSE)
