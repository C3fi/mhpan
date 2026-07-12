#!/usr/bin/env bash

source lib/log.sh

source modules/check.sh
source modules/finish.sh
source modules/fonts.sh
source modules/home.sh
source modules/wallpapers.sh
source modules/themes.sh
source modules/configs.sh
source modules/packages.sh
source modules/services.sh

main(){
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