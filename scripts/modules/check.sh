#!/usr/bin/env bash

check_system() {
    log_info "Starting check system..."
    check_os
    check_user
    check_comp
    check_network

    log_success "All system check passed"
}

check_os(){
    log_info "Check OS..."

    if [[ "$(uname -s)" != "Linux" ]]; then
        die "This script is intended for Linux only."
    fi

    if [[ ! -f /etc/arch-release ]]; then
       die "This script is designed for Arch Linux."
    fi

    log_success "OS: Linux (Arch)"
}

check_user(){
    log_info "Checking user privileges..."

    if [[ $EUID -eq 0 ]]; then
    die "This script should NOT be run as root. Please run as a regular user"
    fi

    log_success "User:$(whoami)(not root)"
}

check_comp(){
    log_info "Checking required commands..."

    require_command bash
    require_command git
    require_command pacman
    require_command curl

    log_success "All required commands are available"
}

check_network(){
    log_info "Checing network connectivity..."

    local ping_cmd
    local target="8.8.8.8"

    if command_exists ping; then
        ping_cmd="ping -c 1 -W 2 $target"
    elif command_exists ping6; then
        ping_cmd="ping6 -c 1 -W 2 $target"
    elif command_exists curl; then
        ping_cmd="curl -s --head --connect-timeout 5 https://google.com >/dev/null"
    else
        die "Neither ping nor curl found. Cannot check network"
    fi

    if eval "$ping_cmd" >/dev/null 2>&1; then
        log_success "Network: connected"
    else 
        die "No internet connection"
    fi
}

