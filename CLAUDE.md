---
description: "项目 CLAUDE.md：赛老师（advisor-companion）全能型混合咨询陪伴顾问 Skill 的维护指南"
globs: ".claude/skills/advisor-companion/**"
---

# 赛老师 · 维护指南

## 项目概述

当前目录：`/Users/simon-mac/project/蒸馏人物、主题/咨询 skills Claude 版/`

顾问已命名为**赛老师**。"赛"取意"赛过自己、不赛过别人"，"老师"是中文里最自然的"我可以请教你"的关系。

项目是一个能记住用户、持续陪伴的混合型咨询顾问 Skill，不是一次性问答。

**GitHub 仓库**：https://github.com/simonsxxs/sai-laoshi

**作者信息**：作者：simon | 微信：simonsxxs | 邮箱：simonsxx@qq.com

## 项目状态（2026-05-22）

全部完成并已推送 GitHub：

| 阶段 | 状态 | 成果 |
|------|------|------|
| Tier-1 蒸馏 | ✅ | 8 个人格 Skill |
| Tier-2 蒸馏 | ✅ | 7 个人格 Skill |
| Tier-3 蒸馏 | ✅ | 8 个人格 Skill |
| 系统集成 | ✅ | 30 个框架 + 53 条消化翻译 |
| 测评 + 修复 | ✅ | 画面型温暖、退缩信号识别、信息量上限、二选一规则 |
| 命名 | ✅ | 赛老师，25 处同步 |
| 产品化打包 | ✅ | README / INSTALL / EXAMPLES / .gitignore |
| 作者替换 | ✅ | 女娲/花叔 → simon，26 处替换 |
| GitHub 推送 | ✅ | sai-laoshi 公开仓库，99 文件 |

## Skill 结构

`.claude/skills/advisor-companion/` 是项目核心产品。

| 路径 | 用途 | 维护说明 |
|------|------|---------|
| `SKILL.md` | 主技能定义（赛老师） | 核心文件，修改后需重启会话生效 |
| `references/frameworks.md` | 30 个框架摘要 | 新增框架或调整框架内容和描述时修改 |
| `references/style-guide.md` | 自适应风格规则（6+1 温暖类型） | 修改沟通风格或添加新风格时修改 |
| `references/conversation-patterns.md` | 对话模式库（含退缩信号识别） | 新增用户类型/高风险应对/沟通模板时修改 |
| `references/dispatch-routes.md` | 内部路由表（10 领域） | 修改诊断逻辑或领域映射时修改 |
| `memory/` | 用户记忆文件 | 自动维护，手动清除可清空用户数据 |
| `scripts/scan-personas.sh` | B 模式人格检测 | 一般不需要修改 |

## 产品文件

| 文件 | 面向 | 用途 |
|------|------|------|
| `README.md` | 用户 | 项目介绍、价值主张、快速上手 |
| `INSTALL.md` | 开发者 | 安装步骤 + 23 人格清单 + 验证方法 |
| `EXAMPLES.md` | 用户 | 10 个真实测评对话场景 |
| `.gitignore` | git | 排除 memory/* 和 .omc/ |

## 关键设计原则（必须遵守）

### 框架完全无感

这是 Skill 最核心的设计约束。回答中：
- 绝不出现框架名：冰山模型、课题分离、认知扭曲、依恋模式等
- 绝不出现人物名：萨提亚、阿德勒、贝克、荣格等
- 框架必须消化为赛老师自己的表达方式

### 温暖模式不是慢

经测评验证的修复：温暖模式 = 匹配对方的表达节奏，不是预设慢。
参考 `style-guide.md`「常犯错误」部分。

### 6+1 温暖类型决策表

温暖不只有一种——必须根据用户当下状态选择：画面型 / 共在型 / 承认型 / 共谋型 / 幽默型 / 代位型 / 重命名型。
详见 `style-guide.md`「6 种温暖方式的选择决策表」。

### 用户退缩信号识别（诊断层，不是风格层）

用户改口/缩小/转移/抽象化/反问时，不是用户在纠正你，是用户在退。
温柔指出退缩信号，给镜子让用户自己决定——这是诊断判断问题，不是温暖方式问题。
详见 `conversation-patterns.md`「用户退缩信号识别」。

### 单轮信息量上限

- 最多 1-2 个待回答问题
- 最多 1 个主框架视角
- 用户消息 <50 字时，回复 ≤300 字

### 三层递进诊断

心理学层（往下挖）→ 生涯层（往上看）→ 策略层（往远看）
详情见 `SKILL.md` 和 `dispatch-routes.md`。

### 不起诊断标签

绝对不说「你是 XX 型」「你可能是 XX 症」。

### 伦理红线
- 用户表达自杀/自伤念头 → 暂停常规对话 → 推荐专业资源
- 不打诊断、不开药、不挑拨用户和现实关系
- 不替用户做决定

## 23 个人格 Skill（全部已完成）

| 梯队 | 目录名 | 人物 |
|------|--------|------|
| Tier-1 | satir / adler / bowlby / beck / jung / frankl / ibarra / christensen | 萨提亚 / 阿德勒 / 鲍尔比 / 贝克 / 荣格 / 弗兰克尔 / 伊瓦拉 / 克里斯坦森 |
| Tier-2 | rosenberg / bowen / yalom / hayes / gottman / grant / palmer | 卢森堡 / 鲍恩 / 亚隆 / 海斯 / 戈特曼 / 格兰特 / 帕尔默 |
| Tier-3 | vanderkolk / linehan / kabat-zinn / newport / hellinger / ellis / minuchin / white | 范德科尔克 / 林内汉 / 卡巴金 / 纽波特 / 海灵格 / 埃利斯 / 米纽钦 / 怀特 |

罗杰斯不作为独立人格，融入顾问底层态度。

## 常见维护操作

### 新增框架
1. 在 `references/frameworks.md` 追加框架定义
2. 在 `references/dispatch-routes.md` 追加到对应领域
3. 在 `SKILL.md` 的框架消化对比表中追加对应翻译

### 修改风格规则
1. 修改 `references/style-guide.md`
2. 同步 `SKILL.md` 中的风格适配部分

### 新增问题领域
1. 修改 `references/dispatch-routes.md` 新增领域映射
2. 修改 `SKILL.md` 的诊断区
3. 在 `references/frameworks.md` 中确认是否需要补充框架

### 添加高风险应对场景
修改 `references/conversation-patterns.md` 的「高风险信号」部分

## 文件大小控制

- `SKILL.md`：控制在 400 行以内
- 每个 reference 文件：控制在 350 行以内
- memory 文件：定期清理过期的决策和跟进记录

## 推送流程

```bash
cd "/Users/simon-mac/project/蒸馏人物、主题/咨询 skills Claude 版"
git add <具体文件>
git -c commit.gpgsign=false commit -m "xxx"
git push origin main
```

注意：git user.email 需用 `128762930+simonsxxs@users.noreply.github.com`（GitHub 隐私保护要求）。
VPN 可能拦截 GitHub 连接（198.18.x.x 是代理假 IP），推送前确认网络通畅。

---

## 维护者记忆系统（Claude ↔ 维护者，不是顾问 ↔ 用户）

> ⚠ **不要和顾问的 `memory/` 目录混淆**
>
> - `.claude/skills/advisor-companion/memory/` = **咨询顾问** 记住 **最终用户** 的对话（产品功能）
> - **yith-archive** = **Claude（我）** 记住 **维护者（你）** 的协作进展（开发工具）
>
> 这两套记忆服务不同对象，互不相关。本节只讲后者。

### 维护新会话开始时（强制）

每次维护者打开本项目开新对话，Claude 第一件事调用：

```
mcp__yith-archive__yith_recall(query="咨询陪伴顾问 advisor-companion 项目状态")
```

召回成功后，直接基于已有状态推进，不要重新读取 references 文件来"了解项目"。

### 何时写入新维护记忆

完成以下任意一项后，主动调用 `mcp__yith-archive__yith_remember`：
- 新增/删除人格视角 → 更新「项目最终状态」记忆
- 修改核心设计原则 → 更新「设计哲学」记忆
- 维护者表达明确偏好/反馈 → 更新「维护者偏好」记忆
- 完成某阶段任务 → 更新「下一步候选」记忆

### 维护记忆的边界

- **不要把维护对话内容写入 `advisor-companion/memory/`**——那是顾问用的，不是维护用的
- **不要把顾问运行时的用户对话写入 yith**——那是用户隐私，不是开发记忆
- yith 只记录 **维护这个 skills 项目** 相关的事：架构决策、文件状态、维护者偏好、待办路线
- 不为日常小修改写——只为「下次开新会话需要 30 秒就接上手」的事写
- 同主题记忆覆盖而非追加——保持单条权威性
