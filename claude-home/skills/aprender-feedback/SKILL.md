---
name: aprender-feedback
description: "Aprende com as correções da Thaciane para acertar de primeira nas próximas vezes. Use ANTES de qualquer tarefa (texto, post, e-mail, apresentação, material, documento do consultório, análise de caso) para ler a base de aprendizados e aplicar as regras do projeto/público e do nicho. Use DEPOIS, sempre que ela aprovar um resultado após ter dado correções ('ficou bom', 'aprovado', 'perfeito', 'agora sim', 'pode mandar', 'fechou', 'é isso'), ou quando pedir 'aprende com isso', 'lembra disso pra próxima', '/aprender-feedback'. Grava só regras que tendem a se repetir, separadas por contexto, sem nunca registrar dados de pacientes."
---

# Aprender com o feedback

Objetivo: transformar as correções que a Thaciane (psicóloga) deu até aprovar um resultado em regras curtas e verificáveis, para acertar de primeira na próxima. Cada projeto/público tem peculiaridades, então o aprendizado é separado por contexto.

Base de conhecimento: `__HOME__/aprendizados/` (INDEX.md, _modelo.md, projetos/, nichos/, skills/).

## SIGILO E DADOS DE PACIENTES (regra obrigatória)

- Trabalhar com a base de dados de pacientes (tratativas, reflexão sobre a progressão dos casos) é normal e esperado. Esta skill **não restringe** nem torna o Claude receoso ao ler, analisar ou atualizar essa base.
- A restrição vale **só para `__HOME__/aprendizados/`**, que é genérica e carregada em várias tarefas. Ali **nunca** gravar: nomes, códigos, iniciais, datas, conteúdo de sessão, diagnósticos ou qualquer dado que identifique ou se refira a um paciente específico. Também nunca senhas ou dados financeiros.
- O que **deve** ser aprendido sobre o trabalho clínico vai para `nichos/psicologia.md`: método e abordagem teórica, como ela gosta que análises de caso e evoluções sejam estruturadas, linguagem e nível de detalhe, perguntas e reflexões que valoriza, o que evitar.
- Aprendizado sobre um paciente específico (ex.: "neste caso a abordagem X funcionou melhor") **não** entra na base de aprendizados: vai no registro do próprio paciente, dentro da base de pacientes, onde o dado já está.
- Dúvida se uma regra pode identificar alguém? Generalize ("em casos de ansiedade social, ...") só se ainda valer como método; se não valer, não grave.

## Parte A — Antes de uma tarefa

1. Ler `__HOME__/aprendizados/INDEX.md`.
2. Identificar projeto/público, nicho e skill(s) da tarefa pelos nomes e apelidos do índice.
3. Ler só os arquivos que batem: `projetos/<slug>.md`, `nichos/<nicho>.md` (psicologia quase sempre se aplica) e `skills/<nome>.md` da skill que vai usar.
4. Aplicar as regras. Em conflito, a precedência é **projeto > nicho > skill/geral**.
5. Se nada bate ou a base está vazia, seguir normalmente — sem avisar nem inventar regras.

## Parte B — Ao terminar com correções aprovadas

**Quando rodar:** só se houve pelo menos uma rodada de correção. Aprovação de primeira = nada a aprender, não grave nada. Contam como correção também as ações que ela interrompeu ou recusou com orientação ("não, faz assim").

**Passos:**

1. **Levantar** as correções da conversa: o que ela pediu para mudar, o que recusou, o que elogiou ao aprovar.
2. **Filtrar:** ignorar ajustes pontuais daquele entregável (um fato, um nome, uma frase específica). Gravar só o que tende a se repetir.
3. **Escrever cada regra** de forma direta e verificável, neste formato exato:
   `- <regra> — por quê: <motivo> · <AAAA-MM-DD> · <tarefa de origem>`
   "Verificável" = dá para conferir olhando o texto pronto (ex.: "frases com até 20 palavras", não "escreva de forma leve"). Se ela não disse o motivo, deduza do contexto; se não der, escreva "preferência da Thaciane".
4. **Classificar** onde gravar:
   - estilo/tom/visual de um projeto ou público → `projetos/<slug>.md`
   - regra da área que vale sempre (ética e publicidade do CFP, linguagem cuidadosa sobre saúde mental, não prometer resultados/cura, avisos e gatilhos) e método de trabalho clínico → `nichos/psicologia.md`
   - erro técnico de uma ferramenta → `skills/<nome-da-skill>.md`
5. **Promoção:** só subir uma preferência de projeto para o nicho se ela for inerente à área ou se repetir em 2+ projetos. Ao promover, mantenha a origem na regra ("vista em: projeto-a, projeto-b").
6. **Gravar:** se o arquivo não existe, criar a partir de `_modelo.md` e registrar no `INDEX.md` (nome, apelidos, arquivo). Atualizar e mesclar regras existentes em vez de duplicar. Se ela mudou de ideia, substituir a regra antiga e anotar a mudança com data em "Histórico de mudanças". Manter cada arquivo com menos de 80 linhas (se estourar, consolidar regras parecidas).
7. **Resumo final** de 3–5 linhas: o que foi aprendido e em qual arquivo, para ela poder vetar. Se ela vetar, remova a regra imediatamente.

## Skills de terceiros e de plugins

Nunca editar skills instaladas de terceiros ou de plugins (são sobrescritas nas atualizações). Os ajustes delas vão em `skills/<nome>.md` na base. Skills criadas por ela podem ser editadas de forma mínima, e só com o ajuste claramente necessário.

## Notas

- Não usar hooks de Stop: esta skill roda por descrição e pelo CLAUDE.md global.
- Escrever os arquivos da base em português, enxutos, sem enfeite.
