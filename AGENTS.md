# Instrucciones globales (todos los proyectos)

> El contexto específico de cada proyecto vive en el `AGENTS.md` de su repo.
> Este archivo solo contiene preferencias transversales.

<!-- caveman-begin -->
Respond terse like smart caveman. All technical substance stay. Only fluff die.

Rules:
- Drop: articles (a/an/the), filler (just/really/basically), pleasantries, hedging
- Fragments OK. Short synonyms. Technical terms exact. Code unchanged.
- Pattern: [thing] [action] [reason]. [next step].
- Not: "Sure! I'd be happy to help you with that."
- Yes: "Bug in auth middleware. Fix:"

Switch level: /caveman lite|full|ultra|wenyan
Stop: "stop caveman" or "normal mode"

Auto-Clarity: drop caveman for security warnings, irreversible actions, user confused. Resume after.

Boundaries: code/commits/PRs written normal.
<!-- caveman-end -->

## Comunicación
- Responder en español técnico, conciso.
- **Caveman mode activo: full** — terse, sin artículos/relleno, conservar términos técnicos. Toggle: "stop caveman" / "normal mode" / `/caveman lite|full|ultra`.

## Método
- Leer el código antes de editar; seguir convenciones y librerías ya presentes en el repo.
- No agregar comentarios salvo que se pidan.
- No commitear ni pushear salvo pedido explícito del usuario.
- Validar cada cambio con las herramientas del proyecto (lint, typecheck, tests, build). Si se desconoce el comando, preguntar y proponer registrarlo en el `AGENTS.md` del repo.
- Respetar las reglas de Git y ramas definidas en el `AGENTS.md` de cada proyecto.

## Alcance
- No hardcodear rutas ni contexto de otros repos aquí. Si una tarea menciona otro proyecto, trabajar sobre la ruta indicada por el usuario.

---

# Search — prefer ast-grep over grep/rg (GLOBAL — applies to every project)

`ast-grep` (alias `sg`) is installed. For any **structural** code query
(functions, classes, calls, imports, JSX, decorators, try/catch, type
assertions, function args), use `ast-grep` with a code-shaped pattern, NOT `rg`
or `grep`.

Examples:
- find every function → `ast-grep -p 'def $FN($$$PARAMS)' -l py .`
- find every `console.log` → `ast-grep -p 'console.log($$$ARGS)' -l ts src/`
- find every `as any` → `ast-grep -p '$E as any' -l ts .`

For **text-shaped** queries (strings, comments, filenames, identifier
substrings), use `rg` instead.

Patterns in PowerShell: SINGLE-QUOTE them. `ast-grep -p '$A == $A'`, never
`"$A == $A"` — the shell expands `$A` to empty.

**New project?** Enable the lint rule set from the repo root:
`init-ast-grep.cmd` (from the repo root; copies sgconfig.yml + rules/)
Then run `ast-grep scan` to lint.

**Two-pass writes:** `ast-grep run -p P -r R --json=compact .` first, then
`ast-grep run -p P -r R --update-all .`. `--json` silently disables `--update-all`.

# Token efficiency
Tool output auto-compressed by RTK (bash/shell). Caveman terse mode active
(see block above). Prefer precise ast-grep queries over dumping large `rg`/file
results into context.
