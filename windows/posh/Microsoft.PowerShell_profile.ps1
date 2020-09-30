# Microsoft PowerShell Profile
# File should be kept in:
# 
# PS❯ $mydocs = [environment]::getfolderpath("mydocuments")
# PS❯ cd $mydocs\PowerShell

# Aliases for git
# I was having one of those days.
New-Alias gitt "git"
New-Alias get "git"
New-Alias gett "git"
New-Alias got "git"
New-Alias gott "git"

# Alias for VS Code
# This ensures that we're using the User-installed version of VS Code; not a system-level "unupgradable" version.
New-Alias c "C:\Users\jschmidt\AppData\Local\Programs\Microsoft VS Code\Code.exe"
New-Alias code "C:\Users\jschmidt\AppData\Local\Programs\Microsoft VS Code\Code.exe"
New-Alias e "C:\Users\jschmidt\AppData\Local\Programs\Microsoft VS Code\Code.exe"
New-Alias edit "C:\Users\jschmidt\AppData\Local\Programs\Microsoft VS Code\Code.exe"

# Alias for VS Code Insiders
New-Alias ci "C:\Users\jschmidt\AppData\Local\Programs\Microsoft VS Code Insiders\Code - Insiders.exe"
New-Alias ei "C:\Users\jschmidt\AppData\Local\Programs\Microsoft VS Code Insiders\Code - Insiders.exe"

Function Update-Pip {
    pip list -o --format json `
    | ConvertFrom-Json `
    | ForEach-Object {pip install $_.name -U --no-warn-script-location}
}

### Making PowerShell Pretty!

# Enable Get-ChildItemColor
# https://github.com/joonro/Get-ChildItemColor
If (-Not (Test-Path Variable:PSise)) {  # Only run this in the console and not in the ISE
    Import-Module Get-ChildItemColor
    
    Set-Alias l Get-ChildItem -option AllScope
    Set-Alias ls Get-ChildItemColorFormatWide -option AllScope
}

# Scott Hanselman's "Pretty Commandline" Powerline Module stuff
# https://www.hanselman.com/blog/HowToMakeAPrettyPromptInWindowsTerminalWithPowerlineNerdFontsCascadiaCodeWSLAndOhmyposh.aspx
Import-Module posh-git
Import-Module oh-my-posh
Set-Theme Paradox
