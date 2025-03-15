# this file is made to replace scrcpy in EnvVar or
# you can add this function to your powershell config File
function scrcpy {
    # Change this to your personal paths
    $scrcpy_move = "C:/path/to/scrcpy-move.ahk"
    $ahk_exe     = "C:/Program Files/AutoHotkey/v2/AutoHotkey.exe"

    # this is Optional for some default args
    if ($args[0] -eq "--") { $scrcpyArgs = $args }
    else { $scrcpyArgs = @("--window-borderless", "--turn-screen-off", "--stay-awake") + $args }

    # Start the AHK script in the background
    $scrcpy_move = Start-Process -FilePath "$ahk_exe" -ArgumentList "`"$scrcpy_move`"" -PassThru

    # Start Scrcpy and wait until it exits
    scrcpy.exe @scrcpyArgs

    # Kill the AHK script when Scrcpy exits
    Stop-Process -Id $scrcpy_move.Id -ErrorAction SilentlyContinue
}

function:scrcpy @args