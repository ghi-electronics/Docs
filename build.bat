@ECHO OFF

SETLOCAL

SET ScriptRoot=%~dp0

PUSHD "%ScriptRoot%"

RMDIR /s /q docs
RMDIR /s /q obj

MKDIR docs

REM SET to supress newline at end of file
ECHO | SET /p="docs.ghielectronics.com" > docs/CNAME

docfx

POPD

ENDLOCAL
