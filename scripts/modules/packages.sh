#!/usr/bin/env bash

MODULE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$MODULE_DIR")"
PACKAGES_DIR="$PROJECT_ROOT/packages"

install_official_package() {
    sudo pacman -S --needed --noconfirm "$1"
}

install_aur_package() {
    local aur_helper
    if command_exists yay; then
        aur_helper="yay"
    elif command_exists paru; then
        aur_helper="paru"
    else
        die "No AUR helper found (yay or paru). Please install one first."
    fi
    $aur_helper -S --needed --noconfirm "$1"
}

install_flatpak_package() {
    flatpak install -y flathub "$1"
}

install_official() {
    local file="$PACKAGES_DIR/official"
    [[ -f "$file" ]] || { log_warn "Official list not found: $file"; return 1; }
    while IFS= read -r pkg; do
        [[ -z "$pkg" || "$pkg" =~ ^# ]] && continue
        log_info "Installing official: $pkg"
        if install_official_package "$pkg"; then
            log_success "Installed official: $pkg"
        else
            log_error "Failed official: $pkg"
        fi
    done < "$file"
}

install_aur() {
    local file="$PACKAGES_DIR/aur"
    [[ -f "$file" ]] || { log_warn "AUR list not found: $file"; return 1; }
    require_command yay || require_command paru || die "No AUR helper"
    while IFS= read -r pkg; do
        [[ -z "$pkg" || "$pkg" =~ ^# ]] && continue
        log_info "Installing AUR: $pkg"
        if install_aur_package "$pkg"; then
            log_success "Installed AUR: $pkg"
        else
            log_error "Failed AUR: $pkg"
        fi
    done < "$file"
}

install_flatpak() {
    local file="$PACKAGES_DIR/flatpak"
    [[ -f "$file" ]] || { log_warn "Flatpak list not found: $file"; return 1; }
    require_command flatpak
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo >/dev/null 2>&1
    while IFS= read -r pkg; do
        [[ -z "$pkg" || "$pkg" =~ ^# ]] && continue
        log_info "Installing Flatpak: $pkg"
        if install_flatpak_package "$pkg"; then
            log_success "Installed Flatpak: $pkg"
        else
            log_error "Failed Flatpak: $pkg"
        fi
    done < "$file"
}

install_packages() {
    log_info "Starting package installation..."
    install_official
    install_aur
    install_flatpak
    log_success "Package installation finished."
}