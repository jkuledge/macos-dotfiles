#!/usr/bin/env bash

function vs_theme() {
    local vscode_user_settings
    vscode_user_settings="$HOME/Library/Application Support/Code/User/settings.json"

    local terminal_theme
    terminal_theme=$(theme.sh -l| grep vscode | fzf)
    theme.sh "$terminal_theme"
    without_prefix="${terminal_theme#vscode-}"
    without_extension="${without_prefix%.conf}"
    formatted_name="${without_extension//_/ }"

    # get the current vscode user settings
    echo "$formatted_name"

    contents=$(jq ".[\"workbench.colorTheme\"] = \"$formatted_name\"" "$vscode_user_settings")

    echo "$contents"

    # echo "$contents" > "$vscode_user_settings"

}


