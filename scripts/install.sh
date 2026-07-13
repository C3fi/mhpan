#!/usr/bin/env bash

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
export PROJECT_ROOT

source "$SCRIPT_DIR/lib/colors.sh"
source "$SCRIPT_DIR/lib/utils.sh"
source "$SCRIPT_DIR/lib/log.sh"
source "$SCRIPT_DIR/modules/check.sh"
source "$SCRIPT_DIR/modules/finish.sh"
source "$SCRIPT_DIR/modules/fonts.sh"
source "$SCRIPT_DIR/modules/home.sh"
source "$SCRIPT_DIR/modules/wallpapers.sh"
source "$SCRIPT_DIR/modules/themes.sh"
source "$SCRIPT_DIR/modules/configs.sh"
source "$SCRIPT_DIR/modules/packages.sh"
source "$SCRIPT_DIR/modules/services.sh"

main(){
    log_info "Starting Mhpan Installer..."

    check_system

    install_configs
    install_fonts
    install_home
    install_wallpapers
    install_packages
    install_themes
    install_services
    finish_installation
}

main "$@"