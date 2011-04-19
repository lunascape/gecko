@echo off
set SCRIPT_DIR=%~dp0Scripts\
rem powershell -command "& {Set-ExecutionPolicy Unrestricted}"
pushd %SCRIPT_DIR%
powershell "& \"%SCRIPT_DIR%%~n0.ps1\""
popd
