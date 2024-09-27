#!/bin/bash

BRAVE_CACHE="$HOME/.cache/BraveSoftware/Brave-Browser/Default/Cache"
CHROME_CACHE="$HOME/.cache/google-chrome/Default/Cache"
VIVALDI_CACHE="$HOME/.cache/vivaldi/Default/Cache"
FIREFOX_CACHE="$HOME/.cache/mozilla/firefox"

CACHE_PATHS=(
    "$BRAVE_CACHE"
    "$CHROME_CACHE"
    "$VIVALDI_CACHE"
    "$FIREFOX_CACHE"
)

cache_clear() {
    local cache_path="$1"

    if [ -d "$cache_path" ]; then
	rm -rf "$cache_path"/*
    else
	echo "PATH NOT FOUND: $cache_path"
    fi
}

for cache_path in "${CACHE_PATHS[@]}"; do
    cache_clear "$cache_path"
done
