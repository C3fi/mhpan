#!/usr/bin/env bash

set -e

PROJECT_ROOT="$(git rev-parse --show-toplevel)"
export PROJECT_ROOT

source "$PROJECT_ROOT/lib/colors.sh"
source "$PROJECT_ROOT/lib/log.sh"
source "$PROJECT_ROOT/lib/utils.sh"
source "$PROJECT_ROOT/lib/error.sh"

source "$PROJECT_ROOT/scripts/check.sh"
source "$PROJECT_ROOT/scripts/packages.sh"
source "$PROJECT_ROOT/scripts/fonts.sh"
source "$PROJECT_ROOT/scripts/configs.sh"
source "$PROJECT_ROOT/scripts/home.sh"
source "$PROJECT_ROOT/scripts/themes.sh"
source "$PROJECT_ROOT/scripts/wallpapers.sh"
source "$PROJECT_ROOT/scripts/finish.sh"

trap 'error_handler $LINENO "$BASH_COMMAND"' ERR

main() {

    log_info "[1/5] Checking system..."
    check_system
    log_success "System check completed."

    log_info "[2/5] Installing packages..."
    install_packages
    log_success "Packages installed."

    log_info "[3/5] Installing configs..."
    install_configs
    log_success "Configs installed."

    log_info "[4/5] Installing home..."
    install_home
    log_success "Home files installed."

    log_info "[5/5] Installing wallpapers..."
    install_wallpapers
    log_success "Wallpapers installed."

    finish

}

main "$@"