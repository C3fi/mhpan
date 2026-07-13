#!/usr/bin/env bash

command_exists(){
    command -v "$1" >/dev/null 2>&1
}

die(){
    log_error "$1"
    exit 1
}

require_command(){
    local cmd="$1"
    local msg="${2:-Command '$cmd' is required but not found}"
    if command_exists "$cmd"; then
    log_success "Found: $cmd"
    else 
    die "$msg"
    fi
}

sync_directory() {
    mkdir -p "$2"
    rsync -avh --no-perms --no-owner --no-group --chmod=u+rwx "$1/" "$2/"
}