# --------------------------------------------------
#
#                  NeoVim
#
# --------------------------------------------------
# create directory for init.lua if it doesn't exist
$nvimDir = "$env:USERPROFILE\AppData\Local\nvim"

if (-not (Test-Path $nvimDir)) {
    New-Item -ItemType Directory -Path $nvimDir | Out-Null
}

# paths to target files
$initLua = "$nvimDir\init.lua"
$cocSettings = "$nvimDir\coc-settings.json"

# source files (your repo or working directory)
$sourceInitLua = Join-Path $PSScriptRoot "nvim\init.lua"
$sourceCocSettings = Join-Path $PSScriptRoot "nvim\coc-settings.json"

# remove existing files if they exist (file or symlink)
if (Test-Path $initLua) {
    Remove-Item $initLua -Force
}
if (Test-Path $cocSettings) {
    Remove-Item $cocSettings -Force
}

# create symbolic links
New-Item -ItemType SymbolicLink -Path $initLua -Value $sourceInitLua | Out-Null
New-Item -ItemType SymbolicLink -Path $cocSettings -Value $sourceCocSettings | Out-Null

Write-Host "Symlinks created:"
Write-Host "  init.lua -> $sourceInitLua"
Write-Host "  coc-settings.json -> $sourceCocSettings"

# ------------------- end of NeoVim ----------------------

