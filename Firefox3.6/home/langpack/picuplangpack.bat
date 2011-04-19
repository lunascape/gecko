@echo off
setlocal
set SCRIPT_DIR=%~dp0Scripts\
set SCRIPT_NAME=%~n0
pushd %SCRIPT_DIR%
SET PATH=C:\Program Files\7-Zip\;%PATH%
powershell "& \".\%SCRIPT_NAME%.ps1\""
popd
pause
