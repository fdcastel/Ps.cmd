try {
    $host.ui.RawUI.WindowTitle = '%~dpn0.ps1';
    & '%~dpn0.ps1' %*;
    $err = -not $?
}
catch
{
    Write-Host $_;
    $err = $true;
    $LastExitCode = 1
};
if ($err) {
    $ppid = (gwmi Win32_Process -Filter processid=$pid).ParentProcessId;
    $cl = (gwmi Win32_Process -Filter processid=$ppid).CommandLine;
    if ($cl -like '*cmd.exe /c*') {
        $gppid = (gwmi Win32_Process -Filter processid=$ppid).ParentProcessId;
        $pn = (gps -id $gppid).ProcessName;
        if ($pn -eq 'explorer') {
            pause
        }
    }
};
exit $LastExitCode