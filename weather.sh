#!/bin/bash

# Author: Haitham Aouati
# GitHub: github.com/haithamaouati
# Description: Weather is a weather client for the terminal.

# Clear the screen
clear

CLEAR="\e[0m"

# Text settings
BOLD="\e[1m"
UNDERLINE="\e[4m"

# Text color
RED="\e[31m"
YELLOW="\e[33m"

# Text color with bold font
RED_BOLD="\e[1;31m"
YELLOW_BOLD="\e[1;33m"

# Prompt for location if not provided as an argument
location=$1
if [ -z "$location" ]; then
    read -p "Location: " location
    # Keep prompting until valid input is provided
    while [ -z "$location" ]; do
        clear
        read -p "Location: " location
    done
fi

# Author info
clear
echo -e "\n\n${YELLOW}$(figlet -f pagga.flf Weather)\n"
sleep 1
echo -e "${YELLOW_BOLD}Weather ${CLEAR}by Haitham Aouati"
echo -e " The right way to check the weather.\n" | pv -qL 10
echo -e "GitHub: ${UNDERLINE}github.com/haithamaouati${CLEAR}\n"

# Display weather report header
echo -e "Weather report: $location\n"

# Fetch weather report
weather_report=$(curl -sS --connect-timeout 10 "https://wttr.in/${location}?0?Q?F")

# Check if curl command was successful
if [ $? -ne 0 ]; then
    echo "Failed to fetch weather report. Please check your internet connection or try again later."
else
    echo -e "$weather_report\n"
    # Show you the current date and time
    date_time=$(date)
    echo -e "$date_time\n"
fi
