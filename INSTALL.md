# 安装指南

## 前置条件

- [Claude Code CLI](https://docs.anthropic.com/en/docs/claude-code) 已安装
- 一个项目目录(可以是空项目,也可以是已有项目)

## 安装步骤

### 1. 复制 Skill 目录

将整个 `advisor-companion/` 目录复制到你的项目下的 `.claude/skills/`:

```bash
# 在你的项目根目录下
mkdir -p .claude/skills
cp -r advisor-companion .claude/skills/
```

完整的目录结构应该是:

```
你的项目/
└── .claude/
    └── skills/
        └── advisor-companion/
            ├── SKILL.md
            ├── references/
            │   ├── frameworks.md
            │   ├── dispatch-routes.md
            │   ├── style-guide.md
            │   └── conversation-patterns.md
            ├── memory/
            │   ├── profile.md
            │   ├── decisions.md
            │   ├── followups.md
            │   └── insights.md
            └── scripts/
                └── scan-personas.sh
```

### 2. 重启 Claude Code 会话

```bash
# 退出当前会话(如果在运行中)
# 重新启动
claude
```

### 3. 验证安装

在 Claude Code 中输入:

```
赛老师
```

如果赛老师正常回复自我介绍,说明安装成功。

## B 模式增强(可选)

赛老师自带 30 个框架的内置摘要,可以独立运行。如果你安装了对应的人格 Skill,赛老师会自动升级为读取完整文件——框架更深层,回答更精准。

### 安装人格 Skill

将 `*-perspective/` 目录复制到 `.claude/skills/`:

```bash
cp -r adler-perspective .claude/skills/
cp -r bowlby-perspective .claude/skills/
cp -r beck-perspective .claude/skills/
# ... 按需安装
```

### 可用的人格 Skill

#### 第一梯队(高频通用)

| 目录名 | 覆盖领域 |
|--------|---------|
| `satir-perspective` | 冰山深挖、家庭沟通姿态、自我认知模式 |
| `adler-perspective` | 课题分离、自卑与补偿、社会兴趣 |
| `bowlby-perspective` | 依恋模式识别、安全基地、亲密配对张力 |
| `beck-perspective` | 认知扭曲检验、自动思维、认知三角 |
| `jung-perspective` | 阴影投射、原型、潜意识对话、梦的工作 |
| `frankl-perspective` | 苦难中建构意义、态度选择、三种意义途径 |
| `ibarra-perspective` | 身份转型(行动先于认知)、多重可能自我 |
| `christensen-perspective` | 资源分配理论、人生战略、JTBD |

#### 第二梯队(细分场景)

| 目录名 | 覆盖领域 |
|--------|---------|
| `rosenberg-perspective` | NVC 四步、感受/需要的精确表达、长颈鹿语言 |
| `bowen-perspective` | 家庭系统三角化、代际传递、自我分化 |
| `yalom-perspective` | 直面存在事实(死亡/孤独/自由/无意义)、此时此地 |
| `hayes-perspective` | 认知解离、接纳、价值观锚定(与贝克互补) |
| `gottman-perspective` | 四骑士、修复尝试、永恒问题 vs 可解决问题 |
| `grant-perspective` | 重新思考、给予者边界、心理安全 |
| `palmer-perspective` | 倾听内在召唤、心碎作为路标、"正确但死掉的路" |

#### 第三梯队(特殊场景)

| 目录名 | 覆盖领域 |
|--------|---------|
| `vanderkolk-perspective` | 创伤住在身体里、窗口耐受度、自下而上恢复 |
| `linehan-perspective` | 痛苦耐受、辩证(接纳+改变)、智慧心 |
| `kabat-zinn-perspective` | 正念九态度、当下觉察、与症状共处 |
| `newport-perspective` | 职业资本、工匠思维、深度工作 |
| `hellinger-perspective` | 序位法则、归属、被排除的成员 |
| `ellis-perspective` | ABC 模型、必须主义、无条件自我接纳 |
| `minuchin-perspective` | 子系统边界、层级倒置、家庭结构 |
| `white-perspective` | 问题外化、再作者化、独特结果 |

### 验证 B 模式

```bash
# 运行扫描脚本,查看已检测到的人格
bash .claude/skills/advisor-companion/scripts/scan-personas.sh
```

输出类似:

```
检测到已安装的人格 Skill:
- adler-perspective: 课题分离、自卑与补偿、社会兴趣
- bowlby-perspective: 依恋模式识别、安全基地、亲密配对张力
- beck-perspective: 认知扭曲检验、自动思维、认知三角
```

## 清空用户记忆

如果想重新开始(比如换用户、清空测试数据):

```bash
# 清空记忆文件内容(保留文件结构)
> .claude/skills/advisor-companion/memory/profile.md
> .claude/skills/advisor-companion/memory/decisions.md
> .claude/skills/advisor-companion/memory/followups.md
> .claude/skills/advisor-companion/memory/insights.md
```

## 卸载

```bash
rm -rf .claude/skills/advisor-companion/
```

如果安装了人格 Skill 也想一并移除:

```bash
rm -rf .claude/skills/*-perspective/
```

## 常见问题

### Q: 赛老师不回复/不触发?

确认 `.claude/skills/advisor-companion/SKILL.md` 存在且文件完整。重启 Claude Code 会话。

### Q: 记忆没有保存?

`memory/` 目录下的文件需要可写权限:

```bash
chmod +w .claude/skills/advisor-companion/memory/*.md
```

### Q: 安装了人格 Skill 但没效果?

1. 确认目录名格式是 `*-perspective`(必须以 `-perspective` 结尾)
2. 运行 `scan-personas.sh` 确认检测到
3. 重启会话

### Q: 适合在公司项目里用吗?

`memory/` 目录已在 `.gitignore` 中排除,用户数据不会提交到 git。但建议在个人项目或私有仓库中使用。
