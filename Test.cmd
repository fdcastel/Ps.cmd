@ECHO OFF

COPY Ps.cmd Samples\Hello.cmd > NUL
CALL Samples\Hello.cmd
IF %ERRORLEVEL% NEQ 0 (
    ECHO 'Hello.cmd' didn't return 0.
    EXIT /B 1
)

COPY Ps.cmd Samples\Error.cmd > NUL
CALL Samples\Error.cmd
IF %ERRORLEVEL% NEQ 3 (
    ECHO 'Error.cmd' didn't return 3.
    EXIT /B 1
)

COPY Ps.cmd Samples\Error-Throw.cmd > NUL
CALL Samples\Error-Throw.cmd
IF %ERRORLEVEL% NEQ 1 (
    ECHO 'Error-Throw.cmd' didn't return 1.
    EXIT /B 1
)

ECHO ** All tests ok!
