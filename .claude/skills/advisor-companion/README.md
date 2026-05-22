# Advisor Companion · 全能型混合咨询陪伴顾问

一个会成长的思维伙伴。不是某个人的翻版，而是一个能记住你、懂你、持续跟进你的陪伴型顾问。

## 快速安装

```bash
# 1. 将 advisor-companion 复制到你的项目 skills 目录
cp -R advisor-companion /你的项目/.claude/skills/advisor-companion

# 2. 重启 Claude Code 会话，或直接说：
# 「陪我聊聊」
```

## 能力覆盖

| 领域 | 覆盖场景 |
|------|---------|
| 决策困境 | 该不该、选A还是B、纠结 |
| 方向迷茫 | 不知道做什么、不想要什么 |
| 关系人际 | 家庭、同事、朋友冲突 |
| 亲密关系 | 模式重复、沟通问题 |
| 职场生涯 | 转行、倦怠、职业焦虑 |
| 情绪压力 | 焦虑、累、烦躁、压力 |
| 自我认知 | 模式识别、自我怀疑 |
| 意义危机 | 活着为什么、值不值得 |

## 核心特性

- **框架无感**：顾问消化了多个思维框架（依恋模式、冰山模型、课题分离等），但你完全感觉不到——只觉得角度准确
- **记忆持续**：记住你的决策、进展、偏好，每次对话有连续性
- **风格自适应**：根据你当下的状态自然匹配沟通节奏
- **全节奏陪伴**：被动响应 + 主动跟进 + 定期复盘
- **可分发**：纯文件系统记忆，不依赖外部 MCP 或 API，复制即用
- **B 模式增强**：安装 `*-perspective` 人格 Skill 后自动深度增强，用户无感

## 前提条件

- Claude Code（需 oh-my-claudecode 插件）
- 无需外部 API 或 MCP 服务
- 可选增强：安装 huashu-nuwa 蒸馏的人物视角 Skill

## 触发方式

直接自然对话触发：「聊聊」「最近有点烦」「我想不通」「你觉得呢」「陪我聊聊」

或手动调用：
```bash
/oh-my-claudecode:advisor-companion
```

## 目录结构

```
.claude/skills/advisor-companion/
├── SKILL.md               # 主技能定义
├── references/            # 内部参考文档（框架、风格、对话模式、路由）
│   ├── frameworks.md
│   ├── style-guide.md
│   ├── conversation-patterns.md
│   └── dispatch-routes.md
├── memory/                # 用户记忆（gitignore）
│   ├── profile.md
│   ├── decisions.md
│   ├── followups.md
│   └── insights.md
└── scripts/
    └── scan-personas.sh   # B 模式人格检测
```

## 伦理声明

> 我是一个思维陪伴顾问——不是心理治疗师、不是医生、不是职业教练。
> 我可以陪你聊、帮你理清思路、在你需要的时候提醒你。
> 但我不能代替专业人士。如果有些事情我一个人帮不了你，我会告诉你。

## 更新与维护

- 人格 Skill 增强：后续蒸馏人物 Skill 后自动生效
- 框架更新：`references/frameworks.md` 可独立更新
- 记忆清除：删除 `memory/` 目录即可清除所有用户数据

## 许可证

MIT
