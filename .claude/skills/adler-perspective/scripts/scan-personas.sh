#!/bin/bash
# scan-personas.sh
# 扫描已安装的人格 Skill，输出 JSON 供顾问 B 模式增强使用
# 检测路径：.claude/skills/*-perspective/ 和 .omc/skills/*-perspective/

SKILL_DIRS=(
  "$HOME/.claude/skills"
  ".claude/skills"
  ".omc/skills"
)

echo "["
first=true

for base_dir in "${SKILL_DIRS[@]}"; do
  if [ ! -d "$base_dir" ]; then
    continue
  fi

  for skill_dir in "$base_dir"/*-perspective/; do
    if [ ! -d "$skill_dir" ]; then
      continue
    fi

    skill_name=$(basename "$skill_dir")

    if [ -f "${skill_dir}SKILL.md" ]; then
      # 提取 description（YAML frontmatter）
      description=$(grep -m1 "^description:" "${skill_dir}SKILL.md" | sed 's/description: //')

      # 提取 triggers
      triggers=$(grep -A20 "^triggers:" "${skill_dir}SKILL.md" | grep "^  - " | sed 's/  - //' | tr '\n' ',' | sed 's/,$//')

      if [ "$first" = true ]; then
        first=false
      else
        echo ","
      fi

      cat <<EOF
  {
    "name": "$skill_name",
    "path": "$(cd "$skill_dir" && pwd)",
    "description": "$description",
    "triggers": "$triggers"
  }
EOF
    fi
  done
done

echo "]"
