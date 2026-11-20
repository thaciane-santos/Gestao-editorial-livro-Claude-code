#!/usr/bin/env bash
# Instala as skills (aprender-feedback, gestao-editorial-livro) e a base de aprendizados em ~/.claude (Mac/Linux).
# Nunca sobrescreve aprendizados existentes; só acrescenta a seção no CLAUDE.md se ainda não houver.
set -euo pipefail
AQUI="$(cd "$(dirname "$0")" && pwd)"
DEST="$HOME/.claude"
mkdir -p "$DEST/aprendizados"
for dir in "$AQUI"/skills/*/; do
  nome="$(basename "$dir")"
  mkdir -p "$DEST/skills/$nome"
  sed "s|__HOME__|$DEST|g" "$dir/SKILL.md" > "$DEST/skills/$nome/SKILL.md"
  echo "Skill instalada: $nome"
done
cp -Rn "$AQUI/aprendizados/." "$DEST/aprendizados/" 2>/dev/null || true
if ! grep -q "aprender-feedback" "$DEST/CLAUDE.md" 2>/dev/null; then
  sed "s|__HOME__|$DEST|g" "$AQUI/CLAUDE-secao.md" >> "$DEST/CLAUDE.md"
  echo "Seção adicionada a $DEST/CLAUDE.md"
else
  echo "CLAUDE.md já tem a seção; não alterei."
fi
if grep -rqs "claude-reflect" "$DEST/settings.json" "$DEST/plugins" 2>/dev/null; then
  echo "ATENÇÃO: o plugin claude-reflect parece estar ativo. Ele é redundante com esta skill; desative em /plugin."
fi
echo "Pronto. Reinicie o Claude Code."
