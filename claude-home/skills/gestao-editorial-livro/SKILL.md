---
name: gestao-editorial-livro
description: "Administra o manuscrito principal do livro, o histórico de versões, as considerações da Ká e as decisões editoriais. Garante que toda edição aprovada seja feita no mesmo documento Word, preservando os originais e registrando cada alteração. Use sempre que a Thaciane mencionar o livro, o manuscrito, capítulos, versões, 'considerações da Ká', 'a Ká sugeriu/comentou', decisões editoriais, 'aprovei essa mudança', 'aplica no livro' ou pedir para editar, comparar ou voltar a uma versão do texto do livro, mesmo sem citar a palavra 'gestão'."
---

# Gestão editorial do livro

Objetivo: manter **um único manuscrito vivo** em Word, com tudo o que mudou rastreável, sem nunca perder o que a autora já tinha. Esta skill cuida do **processo** (versões, registro, decisões). Para a **qualidade do texto** (voz da autora, repetições, estilo), use junto a skill `editor-tecnico-e-coautor`, que já conhece a obra.

## Princípios (e por quê)

- **Um só documento.** Toda edição aprovada acontece no mesmo `.docx` principal. Cópias paralelas ("capitulo-final-v3-ok") geram dúvida sobre qual é a versão valendo.
- **Originais intocáveis.** Antes de editar, guardar uma cópia datada. Assim qualquer decisão pode ser desfeita.
- **Só entra o que foi aprovado.** Sugestões da Ká, ideias suas ou da própria Claude ficam registradas como pendentes até a autora decidir. A autoria é dela.
- **Tudo registrado.** Sem registro, em semanas ninguém lembra por que um trecho mudou.

## Pasta de controle

Ao lado do manuscrito, manter `_controle-editorial/`:

```
_controle-editorial/
├── versoes/                  # cópias datadas do .docx (nunca sobrescrever)
├── historico-alteracoes.md   # cada alteração aplicada
├── consideracoes-ka.md       # tudo o que a Ká comentou, com status
└── decisoes-editoriais.md    # decisões que valem daqui para frente
```

Na primeira vez, perguntar onde está o manuscrito principal, confirmar com a autora qual é o arquivo oficial e criar a pasta. Não inventar caminhos nem conteúdo.

## Fluxo de uma edição

1. **Identificar o pedido** e sua origem: autora, Ká ou preparação de texto.
2. **Registrar a consideração** em `consideracoes-ka.md` (se veio da Ká) com status `pendente`.
3. **Obter a decisão:** `aprovada`, `recusada`, `adiada` ou `aprovada com ajuste` (anotar o ajuste). Só editar o que está aprovado. Dúvida se algo foi aprovado = perguntar.
4. **Snapshot:** copiar o `.docx` para `versoes/AAAA-MM-DD_HHMM_<motivo-curto>.docx` antes da primeira edição da sessão.
5. **Editar no `.docx` principal**, usando a skill `docx`. Preferir alterações rastreadas (tracked changes) para a autora ver e aceitar ou rejeitar. Mudar só o aprovado, sem "melhorar de passagem".
6. **Registrar** em `historico-alteracoes.md`:
   `- AAAA-MM-DD · <capítulo/página/trecho> · de: "<resumo do antes>" → para: "<resumo do depois>" · motivo: <por quê> · origem: <autora|Ká|preparação> · snapshot: <arquivo>`
7. **Atualizar** o status em `consideracoes-ka.md` e, se a decisão valer como regra futura (ex.: "tratar o personagem sempre por X"), anotar em `decisoes-editoriais.md`.
8. **Resumir em 3–5 linhas** o que mudou e onde, para a autora conferir.

## Outras operações

- **Comparar versões / voltar atrás:** trabalhar sempre a partir de cópia de `versoes/`; para restaurar, copiar a versão antiga como novo principal só com ordem explícita, guardando antes o estado atual.
- **Nova consideração da Ká sem decisão ainda:** só registrar como pendente e listar as pendentes quando a autora pedir.
- **Conflito entre considerações** (Ká × autora, ou duas da Ká): não escolher; apresentar as duas lado a lado e pedir a decisão.

## Cuidados

- Nunca apagar nem renomear arquivos de `versoes/`.
- Nunca editar um `.docx` "só para testar": testes em cópia na pasta temporária.
- Registros em português, enxutos, uma linha por alteração.
