# Ps.cmd

A batch file wrapper for PowerShell scripts.

## Why ?

After I had written dozens of wrappers like this one (and each time losing my hair again and again debugging paths, error codes or why the damn thing didn't work when called from Task Scheduler) I decided to write the "last" one to rule them all.

## Usage

Rename the `Ps.cmd` script to the same name of your `.ps1` file and put it in the same folder.

## Features

- Bypass execution policy.
- Pass command-line arguments to Powershell script.
- Preserves ERRORLEVEL returned from Powershell script.
- Works with "Run as administrator"
- Works with Windows Task Scheduler
- When running from Windows Explorer, pauses the script execution in case of error (allows you to see the error message).
  - Doesn't pause when called directly from a `cmd` prompt.

Please see the `Samples` folder. Try to run `Hello.cmd` and `Error.cmd` double-clicking it from Windows Explorer. Then run them again from command prompt.

```
C:\samples>hello
Hello, world!

C:\samples>hello mom
Hello, mom!

C:\samples>echo %ERRORLEVEL%
0

C:\samples>error
Something bad happened!

C:\samples>echo %ERRORLEVEL%
3
```

## A Plea

Please, don't use `.bat` extension for your `cmd.exe` scripts.
