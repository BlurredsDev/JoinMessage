# JoinMessage

🌐 [Русская версия](README_RU.md)

Custom join and quit messages for Minecraft servers with config support.

## Features

- Custom join messages
- Custom quit messages
- Color codes support (&a, &c, &f, etc.)
- {player} placeholder for player name
- Easy config editing

## Installation

Drop `JoinMessage.jar` into your `plugins/` folder and restart the server.

## Config

After first run, edit `plugins/JoinMessage/config.yml`:

```yaml
messages:
  join: "&a+ &f{player} &7joined the server"
  quit: "&c- &f{player} &7left the server"
```

Use `/reload confirm` or restart server to apply changes.

## Color Codes

- `&a` - green
- `&c` - red
- `&f` - white
- `&7` - gray
- `&e` - yellow
- `&b` - aqua
- `&6` - gold

## Compatibility

- Minecraft 1.16.5+
- Spigot / Paper / Purpur
- Java 16+

## Build

1. Download Spigot API 1.16.5 from [GetBukkit](https://getbukkit.org/download/spigot) or [SpigotMC](https://hub.spigotmc.org/nexus/)
2. Put it in `build/spigot-api.jar`
3. Run build script:

```bash
# Windows
COMPILE.bat

# Linux/Mac
chmod +x compile.sh && ./compile.sh
```

## License

MIT

## Author

Blurred
