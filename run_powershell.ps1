#!/usr/bin/env pwsh

If (-not(Get-InstalledModule InvokeBuild -ErrorAction silentlycontinue)) {
  Install-Module InvokeBuild -Scope CurrentUser -Force -Confirm:$False
}

# TODO:
# git clone https://github.com/PowerShell/PowerShellEditorServices.git
# Invoke-Build Build
