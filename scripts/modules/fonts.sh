#!/usr/bin/env bash

install_fonts(){
    log_info "Starting install font"
    set -e
    DOWNLOAD_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip"
    FONT_DIR="$HOME/.local/share/fonts"
    TMP_DIR="$(mktemp -d)"

    cleanup() {
        rm -rf "$TMP_DIR"
    }
    trap cleanup EXIT
    mkdir -p "$FONT_DIR"
    curl -L -o "$TMP_DIR/JetBrainsMono.zip" "$DOWNLOAD_URL"


    unzip -q "$TMP_DIR/JetBrainsMono.zip" -d "$TMP_DIR"
    find "$TMP_DIR" -name "*.ttf" -exec cp -v {} "$FONT_DIR/" \;
    fc-cache -fv
    log_success "Fonts are installed"
}