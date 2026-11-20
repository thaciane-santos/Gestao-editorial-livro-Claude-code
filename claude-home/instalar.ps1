# Instala a skill aprender-feedback e a base de aprendizados em C:\Users\<usuario>\.claude (Windows).
# Nunca sobrescreve aprendizados existentes; só acrescenta a seção no CLAUDE.md se ainda não houver.
$ErrorActionPreference = "Stop"
$aqui = Split-Path -Parent $MyInvocation.MyCommand.Path
$dest = Join-Path $env:USERPROFILE ".claude"
New-Item -ItemType Directory -Force -Path "$dest\aprendizados" | Out-Null
$utf8 = New-Object System.Text.UTF8Encoding($false)
Get-ChildItem "$aqui\skills" -Directory | ForEach-Object {
  $nome = $_.Name
  New-Item -ItemType Directory -Force -Path "$dest\skills\$nome" | Out-Null
  $skill = [IO.File]::ReadAllText("$($_.FullName)\SKILL.md",$utf8).Replace("__HOME__",$dest)
  [IO.File]::WriteAllText("$dest\skills\$nome\SKILL.md",$skill,$utf8)
  Write-Host "Skill instalada: $nome"
}
Get-ChildItem "$aqui\aprendizados" -Recurse -File | ForEach-Object {
  $rel = $_.FullName.Substring("$aqui\aprendizados".Length)
  $alvo = Join-Path "$dest\aprendizados" $rel
  New-Item -ItemType Directory -Force -Path (Split-Path $alvo) | Out-Null
  if (-not (Test-Path $alvo)) { Copy-Item $_.FullName $alvo }
}
$claude = "$dest\CLAUDE.md"
if (-not ((Test-Path $claude) -and (Select-String -Path $claude -Pattern "aprender-feedback" -Quiet))) {
  $sec = [IO.File]::ReadAllText("$aqui\CLAUDE-secao.md",$utf8).Replace("__HOME__",$dest)
  [IO.File]::AppendAllText($claude,$sec,$utf8)
  Write-Host "Seção adicionada a $claude"
} else { Write-Host "CLAUDE.md já tem a seção; não alterei." }
if (Select-String -Path "$dest\settings.json" -Pattern "claude-reflect" -Quiet -ErrorAction SilentlyContinue) {
  Write-Host "ATENÇÃO: o plugin claude-reflect parece estar ativo. Ele é redundante com esta skill; considere desativá-lo."
}
Write-Host "Pronto. Reinicie o Claude Code."
