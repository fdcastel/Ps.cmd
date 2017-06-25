$sourceFile = '.\Source.ps1'
$targetFile = '..\Ps.cmd'

$sourceLines = Get-Content $sourceFile |
    ForEach-Object {
        $_.trim()
    }

$oneLiner = $sourceLines -join ' '

@"
@%SYSTEMROOT%\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -Command "$oneLiner"
"@ | Out-File $targetFile -Encoding ascii
