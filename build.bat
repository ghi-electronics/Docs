@ECHO OFF

SETLOCAL

SET ScriptRoot=%~dp0

PUSHD "%ScriptRoot%"

PUSHD src

docfx -o ..

POPD

xcopy /Y /S /Q _site docs

RMDIR /S /Q _site

POPD

ENDLOCAL
