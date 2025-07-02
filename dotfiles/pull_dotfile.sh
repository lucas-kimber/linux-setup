#!/bin/bash

TARGET="$1"
CONFIG_NAME="$2"

NEW_PATH="$CONFIG_NAME/.config/"

mkdir -p "$NEW_PATH"
mv "$TARGET" "$NEW_PATH/"
stow --target="$HOME" "$CONFIG_NAME"
