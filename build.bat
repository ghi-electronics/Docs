@ECHO OFF

SETLOCAL

SET ScriptRoot=%~dp0

PUSHD "%ScriptRoot%"

docfx

POPD

ENDLOCAL
