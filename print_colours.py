import sys
import re

def hex_to_rgb(hex_color):
    hex_color = hex_color.lstrip('#')

    return tuple(int(hex_color[i:i+2], 16) for i in (0, 2, 4))

def print_color_block(hex_color, label=None):
    try:
        r, g, b = hex_to_rgb(hex_color)
    except ValueError as e:
        print(f"Invalid color: {e}")
        return

    block = ' ' * 20
    label = label or hex_color
    print(f"\033[48;2;{r};{g};{b}m{block}\033[0m {label}")

if __name__ == "__main__":
    
    with open("pallete") as f:
        for x in f:
            print_color_block(x)

