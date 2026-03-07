#!/usr/bin/env sh

set -e

INSTALL_DIR="/usr/local/bin"
REPO="https://raw.githubusercontent.com/ShankarKakumani/adx/main/bin/adx"

echo "Installing adx..."

if [ ! -d "$INSTALL_DIR" ]; then
    echo "Creating $INSTALL_DIR..."
    sudo mkdir -p "$INSTALL_DIR"
fi

curl -fsSL "$REPO" -o "${INSTALL_DIR}/adx"
chmod +x "${INSTALL_DIR}/adx"

echo "Installed adx to ${INSTALL_DIR}/adx"
echo "Run 'adx' to get started."
