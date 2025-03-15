# Scrcpy Window Mover

- [Description](#description)
- [Features](#features)
- [Requirements](#requirements)
- [Instalation](#instalation)
- [Usage](#usage)
- [How It Works](#how-it-works)
- [Notes](#notes)
- [License](#license)

## Description

This AutoHotkey (AHK) script allows you to move and position a **borderless** scrcpy window using keyboard shortcuts. It provides both relative and absolute movement options, along with features like "always on top" toggling and centering.

## Features

- Move scrcpy window **relative to its current position**.
- Quickly align the window to edges or center of the screen.
- Toggle **always on top** mode.
- Normal and Fast movement modes.

## Requirements

- **Operating System:** Windows
- **[AutoHotkey](https://www.autohotkey.com/) Version:** v2.0 or higher

## Instalation

1. Clone this repo `git clone https://github.com/benzaria/scrcpy-move`
2. Run the script when you need it, or add it to `startup` folder.

> [!TIP]
> **Add** this [function](./scrcpy.ps1) to your `powershell` profile. or **Use** it as is.  
> this will start the script **only while using** `scrcpy`

## Usage

| Shortcut                 | Action                  |
| ------------------------ | ----------------------- |
| `Ctrl + Alt + ↑`         | Move up (small step)    |
| `Ctrl + Alt + ↓`         | Move down (small step)  |
| `Ctrl + Alt + ←`         | Move left (small step)  |
| `Ctrl + Alt + →`         | Move right (small step) |
| `Ctrl + Alt + Shift + ↑` | Move up (big step)      |
| `Ctrl + Alt + Shift + ↓` | Move down (big step)    |
| `Ctrl + Alt + Shift + ←` | Move left (big step)    |
| `Ctrl + Alt + Shift + →` | Move right (big step)   |
| `Ctrl + Alt + Space`     | Toggle always on top    |
| `Ctrl + Alt + Home`      | Push left               |
| `Ctrl + Alt + End`       | Push right              |
| `Ctrl + Alt + PageUp`    | Push up                 |
| `Ctrl + Alt + PageDown`  | Push down               |
| `Ctrl + Alt + Enter`     | Center window           |

## How It Works

- **MoveScrcpy(xOffset, yOffset)**: Moves the window by an offset.
- **MoveScrcpyTo(x?, y?)**: Moves the window to an absolute position (if `x` or `y` is omitted, the position remains unchanged).
- **WinSetAlwaysOnTop -1, 'A'**: Toggles "Always on Top" mode.

## Notes

- The script is only active when the scrcpy window is focused.
- `smallStep` and `bigStep` values define movement distance.

## License

This script is licensed under the [MIT License](./LICENSE.md)
