#!/usr/bin/env bash

install_home() {

    log_info "Installing home files..."

    sync_directory \
        "$PROJECT_ROOT/home" \
        "$HOME"

    log_success "Home files installed."

}