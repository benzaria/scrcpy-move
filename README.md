# Scrcpy Window Mover

## Table

- [Scrcpy Window Mover](#scrcpy-window-mover)
  - [Table](#table)
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
- Move scrcpy window **to an absolute position**.
- Toggle **always on top** mode.
- Quickly align the window to edges or center of the screen.
- Normal and fast movement modes.

## Requirements

- **Operating System:** Windows
- **[AutoHotkey](https://www.autohotkey.com/) Version:** v2.0 or higher

## Instalation

1. Clone this repo `git clone https://github.com/benzaria/scrcpy-move`
2. Run the script when you need it, or add it to `startup` folder.

> [!TIP]
> Add the function bellow to your `powershell` config file.  
> this will start the script only while using `scrcpy`
>
> ```powershell
> function scrcpy {
>     # Change this to your personal paths
>     $scrcpy_move = "C:/path/to/scrcpy-move.ahk"
>     $ahk_exe     = "C:/Program Files/AutoHotkey/v2/AutoHotkey.exe"
> 
>     # this is Optional for some default args
>     if ($args[0] -eq "--") { $scrcpyArgs = $args }
>     else { $scrcpyArgs = @("--window-borderless", "--turn-screen-off", "--stay-awake") + $args }
> 
>     # Start the AHK script in the background
>     $scrcpy_move = Start-Process -FilePath "$ahk_exe" -ArgumentList "`"$scrcpy_move`"" -PassThru
> 
>     # Start Scrcpy and wait until it exits
>     scrcpy.exe @scrcpyArgs
> 
>     # Kill the AHK script when Scrcpy exits
>     Stop-Process -Id $scrcpy_move.Id -ErrorAction SilentlyContinue
> }
> ```

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

This script is open-source and free to use. Modify it as needed!
