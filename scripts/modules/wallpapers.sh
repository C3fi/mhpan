#!/usr/bin/env bash

install_wallpapers() {

    log_info "Installing wallpapers..."

    sync_directory \
        "$PROJECT_ROOT/wallpapers" \
        "$HOME/.local/share/wallpapers"

    log_success "Wallpapers installed."

}