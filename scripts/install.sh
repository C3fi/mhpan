#!/usr/bin/env bash

set -e

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
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

    log_info "[1/7] Checking system..."
    check_system
    log_success "System check completed."

    log_info "[2/7] Installing packages..."
    install_packages
    log_success "Packages installed."

    log_info "[3/7] Installing fonts..."
    install_fonts
    log_success "Fonts installed."

    log_info "[4/7] Installing configs..."
    install_configs
    log_success "Configs installed."

    log_info "[5/7] Installing home..."
    install_home
    log_success "Home files installed."

    log_info "[6/7] Installing themes..."
    install_themes
    log_success "Themes installed."

    log_info "[7/7] Installing wallpapers..."
    install_wallpapers
    log_success "Wallpapers installed."

    finish

}

main "$@"