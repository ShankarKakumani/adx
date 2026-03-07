# adx — Android Developer eXperience

WiFi connect + scrcpy mirror for Android devices. One command, zero friction.

## What it does

```
$ adx

  adx v1.1.1  —  2 device(s) connected
  Android Developer eXperience

  CONNECT
    Scan & Connect         Discover WiFi + USB devices -> connect
    Scan & Mirror          Discover -> connect -> launch scrcpy
    Pair                   Pair a new device (Android 11+)

  QUICK
    Reconnect -> Pixel 8   Pick from history -> connect
    Reconnect & Mirror     Pick from history -> connect -> scrcpy

  MANAGE
    Status                 Formatted device table
    Disconnect             Disconnect one or all
    Label Device           Assign friendly names

  SYSTEM
    Upgrade                Self-update to latest version
    Exit
```

Or use commands directly:

```sh
adx scan             # scan & connect
adx mirror           # scan, connect & launch scrcpy
adx reconnect        # reconnect from history
adx remirror         # reconnect & mirror
adx pair             # pair new device
adx status           # formatted device table
adx disconnect       # disconnect one or all
adx label            # name a device
adx upgrade          # update to latest
adx upgrade --list   # pick any version (upgrade or downgrade)
```

## Install

### Homebrew (macOS)

```sh
brew tap ShankarKakumani/adx
brew install adx
```

### Manual

```sh
curl -fsSL https://raw.githubusercontent.com/ShankarKakumani/adx/main/install.sh | sh
```

### From source

```sh
git clone https://github.com/ShankarKakumani/adx.git
ln -s $(pwd)/adx/bin/adx /usr/local/bin/adx
```

## Requirements

- **adb** — Android Debug Bridge
- **fzf** — Fuzzy finder
- **scrcpy** — Screen mirror (only needed for mirror commands)
- **dns-sd** (macOS, built-in) or **avahi-utils** (Linux)

Missing something? `adx` detects it on first run and offers to install it for you.

## Platform support

| Platform | Status |
|----------|--------|
| macOS    | Full support (dns-sd) |
| Linux    | Full support (avahi-browse) |

## Features

- **WiFi + USB** — discovers both wireless (mDNS) and wired devices
- **scrcpy integration** — scan, connect, and mirror in one shot
- **Connection history** — reconnect to previous devices instantly
- **Device labels** — assign friendly names to devices
- **Auto-update check** — daily background check, non-blocking hint
- **Version picker** — upgrade or downgrade to any release
- **Smart dependency installer** — detects missing tools, installs on confirm
- **Colored output** — spinners, success/error indicators, formatted tables
- **Interactive menu** — grouped sections, loops after each action

## First time setup

1. On your Android device: **Settings > Developer Options > Wireless Debugging > ON**
2. Tap **Pair device with pairing code**
3. Run `adx pair` — discovers the device, asks for the code
4. Done. From now on, just `adx` to connect or mirror.

## Updating

```sh
adx upgrade            # latest version
adx upgrade --list     # pick any version
brew upgrade adx       # if installed via homebrew
```

## Config

Stored in `~/.adx/`:

| File | Purpose |
|------|---------|
| `history` | Connection history (most recent first) |
| `labels` | Friendly device names |
| `latest_version` | Cached latest version for update hints |
| `last_update_check` | Timestamp of last update check |

## License

MIT
