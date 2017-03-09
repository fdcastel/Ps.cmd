# Ps.cmd

A `.cmd` wrapper for PowerShell scripts.

## Usage

Rename the script to the same name of your `.ps1` file and put it in the same folder.

## Features

- Bypass execution policy.
- Preserves ERRORLEVEL returned from Powershell script.
- When running from Windows Explorer, pauses the script execution in case of error (allows you to see the error message).
  - Doesn't pause when called directly from a `cmd` prompt.

Please see the `samples` folder. Run `error.cmd` double-clicking it from Windows Explorer. 

```
C:\samples>hello
Hello world

C:\samples>echo %ERRORLEVEL%
0

C:\samples>error
Something bad happened!

C:\samples>echo %ERRORLEVEL%
1
```

