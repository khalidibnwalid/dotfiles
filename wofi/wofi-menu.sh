#!/bin/bash

# This script merges Wofi's default app launcher with custom scripts into a single menu.
# It uses Wofi's dmenu mode to present all options at once.

# --- Dependencies ---
# Wofi: The application launcher.
# systemctl: For power management commands.
# cliphist: For clipboard history.
# xdg-open: To open URLs in your default browser.

# --- Functions for custom menus ---

function do_power_menu() {
    # Provides a menu to power off, reboot, suspend, or log out.
    choices="Poweroff\nReboot\nSuspend\nLogout"
    chosen=$(echo -e "$choices" | wofi --dmenu -p "Power:")
    case "$chosen" in
        "Poweroff") systemctl poweroff ;;
        "Reboot") systemctl reboot ;;
        "Suspend") systemctl suspend ;;
        "Logout") pkill -u "$USER" ;;
    esac
}

function do_clipboard_history() {
    # Shows clipboard history and re-copies a selected item.
    if ! command -v cliphist &> /dev/null; then
        wofi --dmenu -p "Error:" <<< "cliphist not found. Please install it."
        exit 1
    fi
    history=$(cliphist list | wofi -d -p "Clipboard:")
    if [ -n "$history" ]; then
        cliphist decode "$history" | wl-copy
    fi
}

function do_search_engines() {
    # Simple URL encoding function.
    urlencode() {
        python3 -c "import sys, urllib.parse; print(urllib.parse.quote_plus(sys.stdin.read()))" <<< "$1"
    }

    # Provides a menu to select a search engine, then a prompt for the query.
    search_engine=$(echo -e "Google\nYouTube\nDuckDuckGo\nWikipedia" | wofi -d -p "Search Engine:")
    if [ -z "$search_engine" ]; then exit; fi
    search_query=$(wofi -d -p "Search $search_engine:")

    if [ -n "$search_query" ]; then
        case "$search_engine" in
            "Google") xdg-open "https://www.google.com/search?q=$(urlencode "$search_query")" ;;
            "YouTube") xdg-open "https://www.youtube.com/results?search_query=$(urlencode "$search_query")" ;;
            "DuckDuckGo") xdg-open "https://duckduckgo.com/?q=$(urlencode "$search_query")" ;;
            "Wikipedia") xdg-open "https://en.wikipedia.org/wiki/Special:Search/$(urlencode "$search_query")" ;;
        esac
    fi
}

# --- Main Menu Generation and Logic ---

# 1. Define custom script options
custom_options="Power Menu\nClipboard History\nSearch Engines"

# 2. Get a list of all applications from .desktop files
# This extracts the 'Name' from each .desktop file to get the application name.
app_options=$(find /usr/share/applications ~/.local/share/applications -maxdepth 1 -type f -name "*.desktop" -exec grep -m 1 '^Name=' {} \; | sed 's/^Name=//' | sort)

# 3. Combine both lists into a single menu
combined_list=$(echo -e "$custom_options\n$app_options")

# 4. Run Wofi with the combined list
chosen_option=$(echo -e "$combined_list" | wofi --dmenu -p "Search or Select:")

# 5. Handle the user's selection
case "$chosen_option" in
    "Power Menu")
        do_power_menu
        ;;
    "Clipboard History")
        do_clipboard_history
        ;;
    "Search Engines")
        do_search_engines
        ;;
    "")
        # Exit if no option is chosen or Wofi is closed
        exit 0
        ;;
    *)
        # If the choice is not one of the custom options, it must be an application.
        # Run Wofi in drun mode and pre-select the application to launch it directly.
        wofi --show drun -k "$chosen_option" &
        ;;
esac
