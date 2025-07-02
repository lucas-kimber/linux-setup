#!/bin/bash

# Usage: ./recolor.sh "#hexcolor" file1.png file2.png ...

if [ "$#" -lt 2 ]; then
    echo "Usage: $0 \"#hexcolor\" file1.png [file2.png ...]"
    exit 1
fi

COLOR="$1"
shift

for FILE in "$@"; do
    if [[ ! -f "$FILE" ]]; then
        echo "File not found: $FILE"
        continue
    fi

    TMP_ALPHA=$(mktemp --suffix=.png)
    TMP_OUT=$(mktemp --suffix=.png)

    # Extract alpha channel
    convert "$FILE" -alpha extract "$TMP_ALPHA"

    # Recolor visible pixels and apply original alpha
    convert "$FILE" -fill "$COLOR" -colorize 100% -alpha on \
        -compose CopyOpacity "$TMP_ALPHA" -composite "$TMP_OUT"

    # Overwrite original file
    mv "$TMP_OUT" "$FILE"
    rm "$TMP_ALPHA"

    echo "✓ Recolored: $FILE"
done

