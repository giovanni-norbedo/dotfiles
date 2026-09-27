#!/bin/bash

text=$(xsel -o)

if [ -z "$text" ]; then
  notify-send -t 3000 "Translator" "No text selected!"
  exit 1
fi

id=$(notify-send -p -t 5000 "Translator" "Translating...")

translation=$(trans -b -t it "$text")

notify-send -r "$id" -t 15000 "Translation (Italian)" "$translation"
