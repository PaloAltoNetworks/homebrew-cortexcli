# Cortex CLI — Homebrew Tap & Scoop Bucket

Official distribution of **Palo Alto Networks Cortex CLI** (`cortexcli`) for macOS, Linux and Windows.

## Install

### macOS / Linux (Homebrew)

```bash
brew tap PaloAltoNetworks/cortexcli
brew install cortexcli
```

Install a specific older version:

```bash
# If a pinned formula exists for that minor:
brew install PaloAltoNetworks/cortexcli/cortexcli@0.18

# Generic — works for any historical version:
brew tap-new $USER/local-cortex
brew extract --version=0.17.0 cortexcli PaloAltoNetworks/cortexcli $USER/local-cortex
brew install $USER/local-cortex/cortexcli@0.17.0
```

Upgrade:

```bash
brew update && brew upgrade cortexcli
```

### Windows (Scoop)

```powershell
scoop bucket add cortexcli https://github.com/PaloAltoNetworks/homebrew-cortexcli
scoop install cortexcli

# Specific version
scoop install cortexcli@0.17.0

# Upgrade
scoop update cortexcli
```

## Verifying downloads

Every release publishes a `SHA256SUMS` file:

```bash
curl -LO https://github.com/PaloAltoNetworks/homebrew-cortexcli/releases/download/v<VER>/SHA256SUMS
shasum -a 256 -c SHA256SUMS --ignore-missing
```

- macOS binaries are Apple code-signed (TeamID `PXPZ95SK77`, hardened runtime).
- Windows binaries are Authenticode-signed (Palo Alto Networks via DigiCert).
- Linux archives include a detached HSM signature (`cortexcli.signed`).

## License

Proprietary. © Palo Alto Networks, Inc.
