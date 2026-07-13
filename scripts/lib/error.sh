#!/usr/bin/env bash

error_handler() {

    local line="$1"
    local command="$2"

    echo

    log_error "Installation failed."
    log_error "Command: $command"
    log_error "Line: $line"

    echo

    log_warning "Please fix the issue and run install.sh again."

    exit 1

}