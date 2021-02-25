#
# Constants
#

$sourceFile = '.\Source.ps1'

$targetFile = '..\Ps.cmd'
$targetMapSwitchesFile = '..\Ps-Map-Switches.cmd'



#
# Main
#

$sourceLines = Get-Content $sourceFile |
    ForEach-Object {
        $_.trim()
    }

$oneLiner = $sourceLines -join ' '

# Build Ps.cmd
@"
@%SYSTEMROOT%\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -Command "$oneLiner"
"@ | Out-File $targetFile -Encoding ascii

# Build Ps-Map-Switches.cmd
$oneLiner = $oneLiner.Replace('%*', '!__PARAMS!')
@"
@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION
SET __PARAMS=%*
IF [!__PARAMS!] NEQ [] SET __PARAMS=!__PARAMS:/=-!
%SYSTEMROOT%\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -Command "$oneLiner"
ENDLOCAL
"@ | Out-File $targetMapSwitchesFile -Encoding ascii
