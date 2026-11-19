#!/usr/bin/env bash
# Instala a skill aprender-feedback e a base de aprendizados em ~/.claude (Mac/Linux).
# Nunca sobrescreve aprendizados existentes; só acrescenta a seção no CLAUDE.md se ainda não houver.
set -euo pipefail
AQUI="$(cd "$(dirname "$0")" && pwd)"
DEST="$HOME/.claude"
mkdir -p "$DEST/skills/aprender-feedback" "$DEST/aprendizados"
sed "s|__HOME__|$DEST|g" "$AQUI/skills/aprender-feedback/SKILL.md" > "$DEST/skills/aprender-feedback/SKILL.md"
cp -Rn "$AQUI/aprendizados/." "$DEST/aprendizados/"
if ! grep -q "aprender-feedback" "$DEST/CLAUDE.md" 2>/dev/null; then
  sed "s|__HOME__|$DEST|g" "$AQUI/CLAUDE-secao.md" >> "$DEST/CLAUDE.md"
  echo "Seção adicionada a $DEST/CLAUDE.md"
else
  echo "CLAUDE.md já tem a seção; não alterei."
fi
if grep -rqs "claude-reflect" "$DEST/settings.json" "$DEST/plugins" 2>/dev/null; then
  echo "ATENÇÃO: o plugin claude-reflect parece estar ativo. Ele é redundante com esta skill; considere desativá-lo."
fi
echo "Pronto. Reinicie o Claude Code."
