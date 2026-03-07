#!/usr/bin/env sh

set -e

REPO_URL="https://raw.githubusercontent.com/ShankarKakumani/adx/main/bin/adx"

# Try user-local first, fall back to system-wide with sudo
if [ -d "$HOME/.local/bin" ] || mkdir -p "$HOME/.local/bin" 2>/dev/null; then
    INSTALL_DIR="$HOME/.local/bin"
elif [ -w "/usr/local/bin" ]; then
    INSTALL_DIR="/usr/local/bin"
else
    INSTALL_DIR="/usr/local/bin"
    NEED_SUDO=1
fi

echo "Installing adx to ${INSTALL_DIR}..."

if [ "${NEED_SUDO:-}" = "1" ]; then
    sudo curl -fsSL "$REPO_URL" -o "${INSTALL_DIR}/adx"
    sudo chmod +x "${INSTALL_DIR}/adx"
else
    curl -fsSL "$REPO_URL" -o "${INSTALL_DIR}/adx"
    chmod +x "${INSTALL_DIR}/adx"
fi

echo "Installed adx to ${INSTALL_DIR}/adx"

# Check if install dir is in PATH
case ":$PATH:" in
    *":${INSTALL_DIR}:"*) ;;
    *) echo ""
       echo "Add to your shell profile:"
       echo "  export PATH=\"${INSTALL_DIR}:\$PATH\""
       ;;
esac

echo ""
echo "Run 'adx' to get started."
