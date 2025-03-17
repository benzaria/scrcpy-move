# this file is made to replace scrcpy in EnvVar or
# you can add this function to your powershell profile
# to find it run `echo $PROFILE`
function scrcpy {
    # Change this to your personal paths
    $scrcpy_move = "$PSScriptRoot/scrcpy-move.ahk"                  # path relative to this script
    $ahk_exe     = "C:/Program Files/AutoHotkey/v2/AutoHotkey.exe"  # default installation path

    # This is optional for some default args
    if ($args[0] -eq "-") { $scrcpyArgs = $args }
    else { $scrcpyArgs = @("--window-borderless", "--turn-screen-off", "--stay-awake") + $args }

    # Start the AHK script in the background
    $scrcpy_move = Start-Process -FilePath "$ahk_exe" -ArgumentList "`"$scrcpy_move`"" -PassThru

    # Start scrcpy and wait until it exits
    try { scrcpy.exe @scrcpyArgs }

    # Kill the AHK script when scrcpy exits
    finally { Stop-Process -Id $scrcpy_move.Id -ErrorAction SilentlyContinue }
}

scrcpy @args