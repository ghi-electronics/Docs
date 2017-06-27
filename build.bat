@ECHO OFF

SETLOCAL

SET ScriptRoot=%~dp0

PUSHD "%ScriptRoot%\src"

docfx -o ..

POPD

ENDLOCAL
