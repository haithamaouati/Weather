#!/bin/bash

# Author: Haitham Aouati
# GitHub: github.com/haithamaouati

set -euo pipefail

# Text format
normal="\e[0m"
bold="\e[1m"
result="\e[1;33m"
faint="\e[2m"
underlined="\e[4m"
error_color="\e[1;31m"

# Dependencies check (before anything else)
dependencies=(figlet curl)
for cmd in "${dependencies[@]}"; do
    if ! command -v "$cmd" &>/dev/null; then
        echo -e "${error_color}Error:${normal} '$cmd' is required but not installed. Please install it and try again." >&2
        exit 1
    fi
done

# Clear and print banner
print_banner() {
    clear
    echo -e "${result}$(figlet -f standard "Weather")${normal}"
    echo -e "${result}Weather${normal} — The right way to check the weather.\n"
    echo -e " Author: Haitham Aouati"
    echo -e " GitHub: ${underlined}github.com/haithamaouati${normal}\n"
}

# Initialize variables
location=""
attempt=0
max_attempts=3

# Basic URL encoder (fix for special characters like spaces)
urlencode() {
    local raw="$1"
    local encoded=""
    local i char

    for (( i=0; i<${#raw}; i++ )); do
        char="${raw:$i:1}"
        case "$char" in
            [a-zA-Z0-9.~_-]) encoded+="$char" ;;
            ' ') encoded+="%20" ;;
            *) printf -v encoded "%s%%%02X" "$encoded" "'$char"
        esac
    done

    echo "$encoded"
}

# Help message
usage() {
    print_banner
    echo "Usage: $0 -l <location>"
    echo "Options:"
    echo "  -l, --location    Set the location for the weather report"
    echo "  -h, --help        Show this help message"
    echo
    exit 1
}

# Parse arguments
while [[ $# -gt 0 ]]; do
    case "$1" in
        -l|--location)
            if [[ -n "${2:-}" ]]; then
                location="$2"
                shift 2
            else
                echo -e "${error_color}Error:${normal} Missing argument for $1\n" >&2
                usage
            fi
            ;;
        -h|--help)
            usage
            ;;
        *)
            echo -e "${error_color}Error:${normal} Unknown option: $1\n" >&2
            usage
            ;;
    esac
done

# Check if location was provided
if [[ -z "$location" ]]; then
    echo -e "${error_color}Error:${normal} No location provided.\n" >&2
    usage
fi

# URL encode the location
location=$(urlencode "$location")

# Display the header
print_banner

# Header
printf "Fetching weather report for: %b\n\n" "$location"

# Retry mechanism
while [[ $attempt -lt $max_attempts ]]; do
    weather_report=$(curl -sS --connect-timeout 10 "https://wttr.in/${location}?0?Q?F" || true)

    if [[ -n "$weather_report" ]] && [[ "$weather_report" != *"Unknown location"* ]]; then
        printf "%b\n\n" "$weather_report"
        date_time=$(date)
        printf "Report generated at: %b\n\n" "$date_time"
        exit 0
    fi

    attempt=$((attempt + 1))
    echo -e "${faint}Retrying... Attempt $attempt/${max_attempts}${normal}" >&2
    sleep 2
done

# If all retries failed
echo -e "${error_color}Failed:${normal} Could not fetch a valid weather report after $max_attempts attempts.\n" >&2
exit 1
