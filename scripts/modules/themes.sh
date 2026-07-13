#!/usr/bin/env bash

install_themes() {

    log_info "Installing themes..."

    sync_directory \
        "$PROJECT_ROOT/themes" \
        "$HOME/.local/share/themes"

    log_success "Themes installed."

}