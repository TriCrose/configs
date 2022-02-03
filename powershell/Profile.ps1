# Simple prompt, displays [ADMIN] or [DEBUG] if appropriate
function prompt {
    $identity = [Security.Principal.WindowsIdentity]::GetCurrent()
    $principal = [Security.Principal.WindowsPrincipal] $identity
    $adminRole = [Security.Principal.WindowsBuiltInRole]::Administrator

    $(if (Test-Path variable:/PSDebugContext) {'[DEBUG] '}
      elseif($principal.IsInRole($adminRole)) {'[ADMIN] '}
      else {''}) +
    $(Get-Location) +
    $(if ($NestedPromptLevel -ge 1) {'>>'}) +
    '> '
}

# Directory shortcuts
function GoToShellProfile { Set-Location $HOME\Documents\PowerShell }
function GoToMyDocuments { Set-Location $HOME\Documents }
function GoToDesktop { Set-Location $HOME\Desktop }
function GoToDownloads { Set-Location $HOME\Downloads }

# Load profile settings specific to this machine
. ($PSScriptRoot + '\system-specific.ps1')
