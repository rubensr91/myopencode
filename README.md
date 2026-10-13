# My OpenCode Config

Configuración completa de OpenCode para mantener el mismo entorno entre PC's.

## Estructura

- `agents/` - Agentes personalizados
- `skills/` - Skills y comandos extendidos (caveman, cavecrew, etc.)
- `commands/` - Comandos slash personalizados
- `plugins/` - Plugins de OpenCode
- `mcp/` - Configuración MCP (via `opencode.json`)
- `ast-grep-rules/` - Reglas para ast-grep
- `opencode.json` - Configuración principal (providers, plugins, mcp)
- `AGENTS.md` - Instrucciones globales para agentes
- `oh-my-openagent.json` - Config adicional

## Uso

En nuevo PC:

```bash
# Respaldar si existe
mv ~/.config/opencode ~/.config/opencode.bak 2>/dev/null || true

# Clonar
git clone git@github.com:rubensr91/myopencode.git ~/.config/opencode
```

En Windows:

```powershell
# En %USERPROFILE%\.config\opencode
git clone git@github.com:rubensr91/myopencode.git .config\opencode
```

## Actualizar desde PC actual

```bash
cd ~/.config/opencode
git add .
git commit -m "update config"
git push
```

## Sincronizar en otro PC

```bash
cd ~/.config/opencode
git pull
```
