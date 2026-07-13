#!/usr/bin/env bash
install_configs() {

    log_info "Installing configs..."

    sync_directory \
        "$PROJECT_ROOT/config" \
        "$HOME/.config"

    log_success "Configs installed."

}
