function scrcpy {
    # Change this to your personal paths
    $cast_move = "$home/.config/scrcpy/cast-move.ahk"
    $ahk_exe = "C:/Program Files/AutoHotkey/v2/AutoHotkey.exe"

    # this is Optional for some default args
    if ($args[0] -eq "--") { $scrcpyArgs = $args }
    else { $scrcpyArgs = @("--window-borderless", "--turn-screen-off", "--stay-awake") + $args }

    # Start the AHK script in the background
    $cast_move = Start-Process -FilePath "$ahk_exe" -ArgumentList "`"$cast_move`"" -PassThru

    # Start Scrcpy and wait until it exits
    scrcpy.exe @scrcpyArgs

    # Kill the AHK script when Scrcpy exits
    Stop-Process -Id $cast_move.Id -ErrorAction SilentlyContinue
}