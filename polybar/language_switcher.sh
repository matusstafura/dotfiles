#!/bin/bash

# This script echos and switches the system languages in Ubuntu
# for polybar status bar.

function get_current_language() {
    local lang=$(setxkbmap -query | grep layout | awk '{print $2}')
    echo "$lang"
}

function get_list_languages() {
    local lang_list=$(setxkbmap -query | grep layout | awk '{print $2}')
    return "$lang_list"
}

function switch_language() {
    local lang_list=$(get_list_languages | tr ',' ' ')
    for lang in $lang_list; do
        if [[ "$lang" != "$current_lang" ]]; then
            setxkbmap "$lang"
            echo "$lang"
            return
        fi
    done
}

get_current_language
switch_language

