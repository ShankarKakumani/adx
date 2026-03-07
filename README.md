# adx — Android Developer eXperience

WiFi connect + scrcpy mirror for Android 11+ devices. One command, zero friction.

## What it does

```
$ adx
> Scan & Connect      # mDNS scan -> pick device -> adb connect
  Scan & Mirror       # scan -> connect -> scrcpy in one shot
  Reconnect           # pick from history -> connect
  Reconnect & Mirror  # pick from history -> connect -> scrcpy
  Pair                # pair a new device (Android 11+)
  Status              # show connected devices
  Disconnect          # disconnect one or all
  Label Device        # assign friendly names to devices
  Upgrade             # self-update to latest version
```

Or use commands directly:

```sh
adx scan        # scan & connect
adx mirror      # scan, connect & launch scrcpy
adx reconnect   # reconnect from history
adx remirror    # reconnect & mirror
adx pair        # pair new device
adx status      # list connected devices
adx disconnect  # disconnect
adx label       # name a device
adx upgrade     # update adx
```

## Install

### Homebrew (macOS)

```sh
brew tap raknash/tools
brew install adx
```

### Manual

```sh
curl -fsSL https://raw.githubusercontent.com/raknash/adx/main/install.sh | sh
```

### From source

```sh
git clone https://github.com/raknash/adx.git
ln -s $(pwd)/adx/bin/adx /usr/local/bin/adx
```

## Requirements

- **adb** — Android Debug Bridge
- **fzf** — Fuzzy finder
- **scrcpy** — Screen mirror (only for mirror commands)
- **dns-sd** (macOS, built-in) or **avahi-utils** (Linux)

Missing something? `adx` will detect it on first run and offer to install it for you.

## Platform support

| Platform | Status |
|----------|--------|
| macOS    | Full support (dns-sd) |
| Linux    | Full support (avahi-browse) |

## First time setup

1. On your Android device: **Settings > Developer Options > Wireless Debugging > ON**
2. Tap **Pair device with pairing code**
3. Run `adx pair` — discovers the device, asks for the code
4. Done. From now on, just `adx` to connect or mirror.

## Updating

```sh
adx upgrade
```

Or from the interactive menu, select **Upgrade**. This pulls the latest release from GitHub.

## Config

Stored in `~/.adx/`:

| File | Purpose |
|------|---------|
| `history` | Connection history (most recent first) |
| `labels` | Friendly device names |

## License

MIT
