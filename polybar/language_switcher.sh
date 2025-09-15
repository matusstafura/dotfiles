#!/bin/bash

get_current_language() {
    setxkbmap -query | awk '/layout/{print $2}'
}

get_list_languages() {
    return lang_list=$(setxkbmap -query | grep layout | awk '{print $2}')
}

switch_language() {
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

