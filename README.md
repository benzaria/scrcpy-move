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

- Move scrcpy window **Relative Position**.
- Quick align to **Edges** or **Center** of the screen.
- Quick align to a [**Custom Position**](#notes).
- Toggle **always on top** mode.
- Normal and Fast movement modes.

## Requirements

- **Operating System:** Windows
- **[AutoHotkey](https://www.autohotkey.com/) Version:** v2.0 or higher

## Instalation

1. Clone this repo `git clone https://github.com/benzaria/scrcpy-move`
2. Run the script when you need it, or add it to `startup` folder.

> [!TIP]
> **Add** this [function](./scrcpy.ps1) to your `powershell` profile. or **Use** the **file** as is.  
> This will start the script **only while using** `scrcpy`, and **Auto-Close** it

## Usage

| Shortcut                 | Action                          |
| ------------------------ | ------------------------------- |
| `Ctrl + Alt + ↑`         | Move up (small step)            |
| `Ctrl + Alt + ↓`         | Move down (small step)          |
| `Ctrl + Alt + ←`         | Move left (small step)          |
| `Ctrl + Alt + →`         | Move right (small step)         |
| `Ctrl + Alt + Shift + ↑` | Move up (big step)              |
| `Ctrl + Alt + Shift + ↓` | Move down (big step)            |
| `Ctrl + Alt + Shift + ←` | Move left (big step)            |
| `Ctrl + Alt + Shift + →` | Move right (big step)           |
| `Ctrl + Alt + Home`      | Push left                       |
| `Ctrl + Alt + End`       | Push right                      |
| `Ctrl + Alt + PageUp`    | Push up                         |
| `Ctrl + Alt + PageDown`  | Push down                       |
| `Ctrl + Alt + Enter`     | Center window                   |
| `Alt + Enter`            | Go to [Custom Position](#notes) |
| `Alt + Space`            | Toggle always on top            |
| `Alt + Q`                | Quit scrcpy                     |

## How It Works

- **MoveScrcpy(xOffset, yOffset)**: Moves the window by an offset.
- **MoveScrcpyTo(x?, y?)**: Moves the window to an absolute position (if `x` or `y` is omitted, the position remains unchanged).
- **WinSetAlwaysOnTop -1, 'A'**: Toggles "Always on Top" mode.
- **WinClose**: Quit `scrcpy` window.

## Notes

- The script is Only Active when the scrcpy window is Focused.
- `smallStep` and `bigStep` are values that define <font color=ligreen>**Movement Distance**</font>.
- `custom_X` and `custom_Y` are values that define <font color=cyan>**Custom Position Coordinates**</font>.

## License

This script is licensed under the [MIT License](./LICENSE.md)
