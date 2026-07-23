#!/usr/bin/env bash
# =============================================================================
# SYSTEM STATISTICS SCRIPT
# =============================================================================
# Displays CPU usage, temperature, and memory usage.
# Used by Waybar's custom/stats module.
# =============================================================================

# =============================================================================
# CPU USAGE
# =============================================================================
# Extract CPU usage percentage from top (user + system)
cpu=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d% -f1)

# =============================================================================
# TEMPERATURE
# =============================================================================
# Try to read Core 0 temperature; fallback to Package id 0 if not found
temp=$(sensors | grep -m1 "Core 0" | awk '{print $3}' | tr -d '+°C' | cut -d. -f1)
if [ -z "$temp" ]; then
    temp=$(sensors | grep -m1 "Package id 0" | awk '{print $4}' | tr -d '+°C' | cut -d. -f1)
fi
# If still empty, set to "N/A"
[ -z "$temp" ] && temp="N/A"

# =============================================================================
# MEMORY USAGE (GiB)
# =============================================================================
# Retrieve used and total memory in GiB with one decimal place
mem_used=$(free -g | awk '/Mem:/ {printf "%.1f", $3/1.0}')
mem_total=$(free -g | awk '/Mem:/ {printf "%.1f", $2/1.0}')
# (Note: mem_total is currently unused; we only display used memory)
# Alternatively, we could display used/total, but we stick to the original.

# =============================================================================
# OUTPUT
# =============================================================================
# Format: CPU%  TEMP°C  MEMGiB
echo " ${cpu}%  ${temp}°C  ${mem_used}GiB"